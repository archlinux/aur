# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-tree-simple'
pkgver='1.33'
pkgrel='1'
pkgdesc="A simple tree object"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-test-exception>=0.15')
url='https://metacpan.org/release/Tree-Simple'
source=('http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/Tree-Simple-1.33.tgz')
md5sums=('718506f895205613ce05c91d154b7d90')
sha512sums=('bec140fa723a8fadc65d2d8dc88c73295b346bc1583bfb031f2851cf80cddaea9b3e5e38225bbd7ac2e3e29006efb5bbac95b678090ba62714dfd6a306000b25')
_distdir="Tree-Simple-1.33"

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
