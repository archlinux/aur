# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-configtool
pkgver=0.4.10
pkgrel=4
pkgdesc="GTK based config tool for Fcitx"
arch=('x86_64')
url="http://fcitx.googlecode.com/"
license=('GPL2')
depends=("fcitx>=4.2.7" "gtk3" "iso-codes")
optdepends=('fcitx-qt4: for some configuration windows'
            'fcitx-qt5: for some other configuration windows')
makedepends=("cmake")
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('1c1267e9de694bbd5f258b5bba1e7514c4f8556cdc82a1cce5eafd8a4ec571955285dade0acd02f128eca01f867a30c5c6264ee7e91d32a333eba6e4d275fe8f'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

build() {
  cd $pkgname-$pkgver
  echo "Starting make..."

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
