# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-color-monitor
pkgver=0.3.0
pkgrel=1
pkgdesc="This plugin provides three sources to monitor color balances"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/obs-color-monitor.1277/"
license=("GPL2")
depends=("obs-studio")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("13fce32d1e030954cf43d9a66fad1b919ec7138ce124377df1c52ed21eec8b0c")

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
