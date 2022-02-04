# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-color-monitor
pkgver=0.2.6
pkgrel=2
pkgdesc="This plugin provides three sources to monitor color balances"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/obs-color-monitor.1277/"
license=("GPL2")
depends=("obs-studio")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("91c57036c19e9db498872f0af8d11b10508d911a327b7adb0456ba77c4d5eeee")

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr'
  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
}
