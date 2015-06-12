# Contributor: McNoggins < gagnon88 at gmail >
_perlmod=makebeamerinfo
pkgname=perl-app-makebeamerinfo
pkgver=2.002
pkgrel=4
pkgdesc="Creates .info file for use with Impressive and LaTeX Beamer"
arch=('any')
url="https://github.com/jberger/MakeBeamerInfo"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=('perl-module-build')
optdepends=('perl-tk: Enable GUI support')
options=(!emptydirs)
source=("http://www.cpan.org/modules/by-authors/id/J/JB/JBERGER/App-$_perlmod-$pkgver.tar.gz")
sha256sums=('6c8327d76056016508403da0ad848c82429a0e43c1a3b390e952a88adeedd906')

build() {
  cd "$srcdir/App-$_perlmod-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  
  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd "$srcdir/App-$_perlmod-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install installdirs=vendor destdir="$pkgdir"
  
}

# vim:set ts=2 sw=2 et:
