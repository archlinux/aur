# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-pyx'
pkgver='0.07'
pkgrel='1'
pkgdesc="XML to PYX generator"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-parser>=2.23')
makedepends=()
url='http://search.cpan.org/dist/XML-PYX'
source=('http://search.cpan.org/CPAN/authors/id/M/MS/MSERGEANT/XML-PYX-0.07.tar.gz')
md5sums=('74729f5ff3e455daa161fc3dfc5396b5')
sha512sums=('b35b160cb007812d506ab6db703b9d91dfdde56206a313c1459df5a7034eb19fc2bc0ac16f82f9631e051eccb2251ead7dbab1cd7cff8dbc88099bb9bdf66531')
_distdir="XML-PYX-0.07"

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
