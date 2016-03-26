# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-www-scripter'
pkgver='0.031'
pkgrel='1'
pkgdesc="For scripting web sites that have scripts"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-css-dom' 'perl-html-dom>=0.045' 'perl-http-message' 'perl-uri' 'perl-www-mechanize>=1.52' 'perl-libwww')
makedepends=()
url='https://metacpan.org/release/WWW-Scripter'
source=('http://search.cpan.org/CPAN/authors/id/S/SP/SPROUT/WWW-Scripter-0.031.tar.gz')
md5sums=('79a38f2ee500f9d25f8e667584b90832')
sha512sums=('9503a3f2b9c0b6186457a8b057a69d433f33afc91cb6c64757d22a7cce82c454eb9598aa65e7657c9de1817a03fe6d575102412561b7e4a6e8f6bea98ba9c134')
_distdir="WWW-Scripter-0.031"

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
