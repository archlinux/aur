# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lh <jason52lh@gmail.com>

pkgname=fcitx-anthy
pkgver=0.2.4
pkgrel=1
pkgdesc="Fcitx Wrapper for anthy."
arch=('x86_64')
url="https://github.com/fcitx/fcitx-anthy"
license=('GPL')
depends=('fcitx' 'anthy')
makedepends=('cmake' 'intltool')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('31865bed5ff58c36e0360f002e7bfe21a6874d046746d8c781d59df7f48b11dc0b749b825ce0ab26d9a7bdf2c08decac27e14530eff5d1af33dfb25dfd0a90cb'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

build(){
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
