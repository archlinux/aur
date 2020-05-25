# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lh <jason52lh@gmail.com>

pkgname=fcitx-anthy
pkgver=0.2.3
pkgrel=2
pkgdesc="Fcitx Wrapper for anthy."
arch=('x86_64')
url="https://github.com/fcitx/fcitx-anthy"
license=('GPL')
depends=('fcitx' 'anthy')
makedepends=('cmake' 'intltool')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('2769871059053fb370ba84af7cdf0c461d64724a240d58a5a8889cfd9bfb5d145998f79ed2d06a1ae1ab907f9db04fc122bfaf6957ef572fc833e400ffefc642'
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
