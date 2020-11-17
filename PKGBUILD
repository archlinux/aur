# Maintainer: robertfoster

pkgname=librnnoise
pkgver=0.4.1
pkgrel=1
pkgdesc="A noise suppression library based on a recurrent neural network."
arch=(i686 x86_64)
url="https://github.com/xiph/rnnoise"
license=('BSD3' 'Revised')
_commit=90ec41ef659fd82cfec2103e9bb7fc235e9ea66c
source=("$pkgname.tar.gz::https://github.com/xiph/rnnoise/archive/${_commit}.tar.gz")

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
md5sums=('bf89534123d5126260801b67227b87c3')
