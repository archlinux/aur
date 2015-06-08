# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-namespace'
pkgver='0.02'
pkgrel='1'
pkgdesc="Simple support for XML Namespaces"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/XML-Namespace'
source=('http://search.cpan.org/CPAN/authors/id/A/AB/ABW/XML-Namespace-0.02.tar.gz')
md5sums=('f0f9e0b6e3ac6ff5f5e9a834615e224d')
sha512sums=('2758a71b2c7d3928a4c9ff9b3bad312b696c80f493346bdba4061ef0af9f2397d4d1137b88168c24bf022b925a014e0cbd289ea2503abc0c98fe3caf42f90487')
_distdir="XML-Namespace-0.02"

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
