# Maintainer: jujudusud <jujudusud gmail com>

pkgname=freemajor
_pkgname=FreeMajor
pkgver=1.0
pkgrel=2
pkgdesc="TC Electronic G-Major editor"
arch=('x86_64')
url='https://github.com/linuxmao-org/FreeMajor/'
license=('Boost')
depends=('fltk' 'jack')
source=("https://github.com/linuxmao-org/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")

build() {
  mkdir "${_pkgname}-$pkgver"/build
  cd "${_pkgname}-$pkgver"/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "${_pkgname}-$pkgver"/build
  make install DESTDIR="$pkgdir"
}

sha1sums=('2f048a6e779cb28632fa6a39a99ef7c40a6fc0e1')
