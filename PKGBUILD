# Maintainer: hhschen <hhschen820@gmail.com>
pkgname=fcitx5-boshiamy
pkgver=1.0.0
pkgrel=1
pkgdesc="A Boshiamy (嘸蝦米) input method engine for Fcitx 5."
arch=(x86_64)
url="https://github.com/hhschen/fcitx5-boshiamy"
license=('GPL')
depends=('fcitx5' 'fcitx5-chinese-addons')
makedepends=('boost' 'extra-cmake-modules')
conflicts=('fcitx5-table-extra')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dd6900ef41f1ef065ecff96db88c2304c46ffda8174b87e4d558de55cbefabdc')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
}

build() {
  cd "$srcdir/$pkgname-$pkgver/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build .
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
