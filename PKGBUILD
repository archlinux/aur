# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-git-describeversion'
pkgver='1.015'
pkgrel='1'
pkgdesc="Use git-describe to show a repo's version"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-test-mockobject>=1.09')
url='https://metacpan.org/release/Git-DescribeVersion'
source=('http://search.cpan.org/CPAN/authors/id/R/RW/RWSTAUNER/Git-DescribeVersion-1.015.tar.gz')
md5sums=('86c9c60c1a631b87e90fc9c877599230')
sha512sums=('0f5ec543501cb2c0b30718d808f54c3391d682ce00297a78cd9c9beea9fd669bb716d452901384ca8088ae53fae818c89b1e4a165f5341ead6490e6c6f53512c')
_distdir="Git-DescribeVersion-1.015"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl -I. Makefile.PL
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
