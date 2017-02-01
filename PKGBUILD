# Maintainer: archlinux.info:tdy
# Generator: CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-vecstat'
pkgver='0.08'
pkgrel='1'
pkgdesc="Some basic numeric stats on vectors"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Math-VecStat'
source=('http://search.cpan.org/CPAN/authors/id/A/AS/ASPINELLI/Math-VecStat-0.08.tar.gz')
md5sums=('3df23fb451f73bb49fd4ea344ba94020')
sha512sums=('0e88896a7a10846c6ac2ce9264de4b4938000e36bf5e5bb1fd0b8af478b8d02809981067302a2f7b45b29a21fa2ccd60e5f0e628e0bbd634107ab1aff7ac8c9e')
_distdir="Math-VecStat-0.08"

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
