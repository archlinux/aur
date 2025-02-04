# Maintainer: robertfoster

pkgname=librnnoise-nu
pkgver=1.0.0 # renovate: datasource=github-tags depName=GregorR/rnnoise-nu
pkgrel=1
pkgdesc="A noise suppression library based on a recurrent neural network with mods for general purpose usage."
arch=(i686 x86_64)
url="https://github.com/GregorR/rnnoise-nu"
license=('BSD3' 'Revised')
_commit=26269304e120499485438cd93acf5127c6908c68
source=("$pkgname.tar.gz::https://github.com/GregorR/rnnoise-nu/archive/${_commit}.tar.gz")

build() {
  cd "${pkgname#lib}-${_commit}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname#lib}-${_commit}"
  make DESTDIR="$pkgdir/" install
}
sha256sums=('15402f376af177d8d8cd1afd5a7945f16fa83f14636825bbd8509ceffe699adc')
