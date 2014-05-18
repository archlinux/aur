# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx-kkc
pkgver=0.1.1
pkgrel=1
pkgdesc="Fcitx Wrapper for libkkc"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-kkc"
license=('GPL')
depends=('fcitx' 'libkkc' 'libkkc-data' 'skk-jisyo' 'fcitx-qt4')
makedepends=('cmake')
install=$pkgname.install
source=(http://download.fcitx-im.org/${pkgname}/${pkgname}-${pkgver}.tar.xz)

build(){
  cd ${pkgname}-${pkgver}
 
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

sha512sums=('595a4a728112827a6eae4bcbeda87926660fad494c547396da4e5d951aa53aa372261170c261b421056dc626d04fd4bf4728d51fd84e1ec9b7d260ca8d9b0353')
