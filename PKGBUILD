# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-anyevent-http'
pkgver='2.25'
pkgrel='1'
pkgdesc="simple but non-blocking HTTP/HTTPS client"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent>=5.33' 'perl-common-sense>=3.3')
makedepends=()
url='https://metacpan.org/release/AnyEvent-HTTP'
source=("http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/AnyEvent-HTTP-${pkgver}.tar.gz")
md5sums=('3e5f864cc48dae6bce0dcfc9e536c4e6')
sha512sums=('bc189a6a37cb3c3b6f1c36bd965911e110019fec5b8f82bea60dab2e3cf0dda0117a83a5f0608f7865f457b016f94f1ccc78939e22849bceb82a096edc24de9c')
_distdir="AnyEvent-HTTP-2.25"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
