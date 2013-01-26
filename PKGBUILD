# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-sunpinyin
pkgver=0.4.0
pkgrel=1
pkgdesc="Fcitx Wrapper for sunpinyin, Statistical Language Model based pinyin IME by Sun"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
install=fcitx-sunpinyin.install
depends=('fcitx>=4.2.7' 'sunpinyin>2.0.3' 'sunpinyin-data' 'gtk-update-icon-cache')
makedepends=('cmake')
source=("http://fcitx.googlecode.com/files/${pkgname}-${pkgver}.tar.xz")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}

md5sums=('de2723baf8e5d9092706cd2baf2f21bb')
