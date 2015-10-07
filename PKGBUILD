# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-cgi-ex'
pkgver='2.44'
pkgrel='1'
pkgdesc="CGI utility suite - makes powerful application writing fun and easy"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-template-alloy>=1.016')
makedepends=()
url='https://metacpan.org/release/CGI-Ex'
source=('http://search.cpan.org/CPAN/authors/id/L/LJ/LJEPSON/CGI-Ex-2.44.tar.gz')
md5sums=('b6c4723cf7c64606cc43310f7b54e830')
sha512sums=('8415763c9c271c148ac5faa2ac0d2cf5d2865c16f5fd0bbba1a9c9a9b0b0f3a2afea085fe020981b6a61a40eb760e5e23214f14931085c7f6281b3fff3908a16')
_distdir="CGI-Ex-2.44"

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
