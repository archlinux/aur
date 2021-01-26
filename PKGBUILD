# Maintainer: robertfoster

pkgname=librnnoise
pkgver=0.4.1
pkgrel=4
pkgdesc="A noise suppression library based on a recurrent neural network."
arch=(i686 x86_64)
url="https://gitlab.xiph.org/xiph/rnnoise"
license=('BSD3' 'Revised')
_commit=1cbdbcf1283499bbb2230a6b0f126eb9b236defd
source=("${pkgname}-${_commit}.tar.gz::https://github.com/xiph/rnnoise/archive/${_commit}.tar.gz")

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

md5sums=('a1069e1ad3e5fdc0cc5e40252e0fd1a2')
