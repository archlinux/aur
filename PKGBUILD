# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-struct-diff'
pkgver='0.98'
pkgrel='1'
pkgdesc="Perl/CPAN Module Struct::Diff: Recursive diff for nested perl structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-algorithm-diff>=1.19' 'perl-clone')
makedepends=()
url='https://metacpan.org/release/Struct-Diff'
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIXAS/Struct-Diff-$pkgver.tar.gz")
md5sums=('78c861fea740d5f685ea9cb636240166')
sha512sums=('43d4636b777f4a19c7b4c92f887e829a1fba1e2b0aa44eb814b7435d19bde22d55f7893d41c5b91a866bc64d3882d6ba470344d5255e0a90ebd1c2a18b8776f1')
_distdir="Struct-Diff-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
