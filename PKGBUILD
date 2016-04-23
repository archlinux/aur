# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-anyevent-http'
pkgver='2.22'
pkgrel='1'
pkgdesc="simple but non-blocking HTTP/HTTPS client"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent>=5.33' 'perl-common-sense>=3.3')
makedepends=()
url='https://metacpan.org/release/AnyEvent-HTTP'
source=('http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/AnyEvent-HTTP-2.22.tar.gz')
md5sums=('e27736c4592031adccfa0638419a3b70')
sha512sums=('3408b5339cc85e8d37dc6c4f40a0f1ad9436fb9b261e6a14b5a7913f8ee6c2ba7e80aec376af48190c76219fbcadf9c68c2d67c4ab60c77044093f6ec70f4aac')
_distdir="AnyEvent-HTTP-2.22"

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
