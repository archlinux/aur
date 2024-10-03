# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator : CPANPLUS::Dist::Arch 1.32

pkgname='perl-linux-desktopfiles'
pkgver='0.26'
pkgrel='1'
pkgdesc="Linux::DesktopFiles - a very fast Perl module for parsing the Linux desktop files."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.14.0')
makedepends=()
url='https://metacpan.org/release/Linux-DesktopFiles'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Linux-DesktopFiles-$pkgver.tar.gz")
b2sums=('5f5a69390a1a528b4195bda36dd2d9a08a25cd121883c9e24ffd1ff3419d372070ce8997cb859a3fecd8dc8e9d9647b57fd3a72b1631f0e5e14ad900a40d9e01')
_distdir="Linux-DesktopFiles-${pkgver}"

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
  rm -r "$pkgdir/usr/lib"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
