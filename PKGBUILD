# CPAN Name  : Import-Into
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-import-into'
pkgver='1.002004'
pkgrel='1'
pkgdesc="Import packages into other packages"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-runtime>=0' 'perl>=5.006')
makedepends=()
url='http://search.cpan.org/dist/Import-Into'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Import-Into-1.002004.tar.gz')
md5sums=('70f2f3b08a5b706ee382a8448c346cb1')
sha512sums=('387fb6302417bda94fffe7215e22774d9345af0f2df9f39dc089abcf4a0e164521d2223ddaeed7179a341720e1ae399ada6ff02b5aef75c9a00a74e2cf752005')
_distdir="Import-Into-1.002004"

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
