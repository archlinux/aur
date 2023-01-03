# CPAN Name  : String-Interpolate
# Maintainer: xuhcc <xuhcc at cryptolab dot net>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-string-interpolate'
pkgver='0.33'
pkgrel='1'
pkgdesc="Wrapper for builtin the Perl interpolation engine."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-padwalker>=0' 'perl-safe-hole>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/String-Interpolate'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/String-Interpolate-0.33.tar.gz')
md5sums=('8a60634dfb00b1088c7fafd345f576f2')
sha512sums=('49201f084d9cfc7cde39a9d1474f3f5ab3de05bbc1121403d9b7508125f178c3bd7d5c00097a011354ce119de1799b2b3c49ae6cfaead99a0e061cbdc6ec2efb')
_distdir="String-Interpolate-0.33"

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
