# CPAN Name  : Git-Wrapper
# Maintainer:  Michael DeGuzis <mdeguzis@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-git-wrapper'
pkgver='0.047'
pkgrel='1'
pkgdesc="Wrap git(7) command-line interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-chdir>=0' 'perl-sort-versions>=0')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-exception>=0')
url='https://metacpan.org/release/Git-Wrapper'
source=('http://search.cpan.org/CPAN/authors/id/G/GE/GENEHACK/Git-Wrapper-0.047.tar.gz')
md5sums=('58ab70ecfd306a0fd678d405b15715e9')
sha512sums=('9a2c9bf30a9b803170adfeae9bbe41e1b0fc9e67fe477d4fdf1d20a57917c69c1c6be2a90fbc382f85cf83a209b39a9a3431276b33a6e7655b8cd240d1a68e78')
_distdir="Git-Wrapper-0.047"

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
