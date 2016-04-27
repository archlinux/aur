# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lh <jason52lh@gmail.com>

pkgname=fcitx-anthy
pkgver=0.2.2
pkgrel=3
pkgdesc="Fcitx Wrapper for anthy."
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx' 'anthy')
makedepends=('cmake' 'intltool')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")

build(){
  cd ${pkgname}-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

md5sums=('956660d67900f59fa7fd80d68cc4ad7c')
