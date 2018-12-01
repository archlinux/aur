# CPAN Name  : Git-Wrapper
# Maintainer:  Michael DeGuzis <mdeguzis@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-git-wrapper'
pkgver='0.048'
pkgrel='1'
pkgdesc="Wrap git(7) command-line interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('git' 'perl-file-chdir>=0' 'perl-sort-versions>=0')
makedepends=('perl-devel-checkbin')
checkdepends=('perl-test-deep>=0' 'perl-test-exception>=0')
url='https://metacpan.org/release/Git-Wrapper'
source=('https://cpan.metacpan.org/authors/id/G/GE/GENEHACK/Git-Wrapper-0.048.tar.gz')
md5sums=('8dcb01a160c400b655c0ba69f57f054f')
_distdir="Git-Wrapper-0.048"

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
