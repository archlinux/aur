# Maintainer: robertfoster

pkgname=librnnoise
pkgver=0.4.1
pkgrel=2
pkgdesc="A noise suppression library based on a recurrent neural network."
arch=(i686 x86_64)
url="https://gitlab.xiph.org/xiph/rnnoise"
license=('BSD3' 'Revised')
_commit=125d8a56e0049728c86c9a575dab348fc9523e96
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

md5sums=('3f4ae1ca4d7d74fe50eeee9c7397fd2b')
