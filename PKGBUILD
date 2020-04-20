# Maintainer: jujudusud <jujudusud gmail com>

pkgname=freemajor
pkgver=1.0
pkgrel=1
pkgdesc="TC Electronic G-Major editor"
arch=('x86_64')
url='https://github.com/linuxmao-org/FreeMajor/'
license=('Boost')
depends=('fltk' 'jack')
source=("https://github.com/linuxmao-org/FreeMajor/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz" "FreeMajor.desktop")

build() {
  mkdir "FreeMajor-$pkgver"/build
  cd FreeMajor-$pkgver/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
  cd ..
}

package() {
  cd "FreeMajor-$pkgver"/build
  make install DESTDIR="$pkgdir"
}

sha1sums=('2f048a6e779cb28632fa6a39a99ef7c40a6fc0e1'
          'ba7881159c242e3a69da7e0d965f47679e6bd371')
