# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-osprereqs'
pkgver='0.011'
pkgrel='1'
pkgdesc="List prereqs conditional on operating system"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=0' 'perl-moose>=0' 'perl-namespace-autoclean>=0' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='https://metacpan.org/release/Dist-Zilla-Plugin-OSPrereqs'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Dist-Zilla-Plugin-OSPrereqs-0.011.tar.gz')
md5sums=('06db0981ced5a012d6a82dee35edb30b')
sha512sums=('1103eebef6db63ce410f2033a641a3af3457ea9623d138ca7a9506847f1421e6dc26755973aaa1b8e56b3edb9664bbbba915aa39714683b42f42922bfe0926c3')
_distdir="Dist-Zilla-Plugin-OSPrereqs-0.011"

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
