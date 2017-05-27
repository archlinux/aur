# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
_perlmod=UNIVERSAL-DOES
pkgname=perl-universal-does
pkgver=0.005
pkgrel=2
pkgdesc="Provides UNIVERSAL::DOES() method for older perls"
arch=("any")
url="http://search.cpan.org/~gfuji/$_perlmod/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl' 'perl-module-build')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/G/GF/GFUJI/$_perlmod-$pkgver.tar.gz)
sha512sums=('27b22babf6a853211f3aba0f635bc222c6c421b50f1d126712c059590745ecece631382d0fecbfa8f44a85ea6cf93af548d87386ec0eb3145f67dd87550b1c65')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build install
}
