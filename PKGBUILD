# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=lierolibre
pkgver=0.5
pkgrel=1
pkgdesc='Completely free Liero fork'
arch=('i686' 'x86_64')
url='https://launchpad.net/lierolibre'
license=('LGPL2.1')
depends=('sdl' 'zlib' 'libconfig' 'sdl_mixer' 'boost-libs' 'hicolor-icon-theme'
         'xdg-utils')
makedepends=('boost')
install=$pkgname.install
source=(https://launchpad.net/lierolibre/trunk/$pkgver/+download/lierolibre-$pkgver.tar.xz)
md5sums=('f4c89eb6a55f7baa4594fe6f244ba793')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --libexec=/usr/lib
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
