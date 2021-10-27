# Maintainer: tytan652 <tytan652@tytanium.xyz>

_reponame=obs-ptz
pkgname=$_reponame-controls
pkgver=0.9.0
pkgrel=1
pkgdesc="Plugin for OBS Studio to add a PTZ Camera control dock"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/ptz-controls.1284/"
license=("GPL2")
depends=("obs-studio" "qt5-gamepad" "qt5-serialport")
makedepends=("cmake")
source=("$_reponame-$pkgver.tar.gz::https://github.com/glikely/$_reponame/archive/v$pkgver.tar.gz")
sha256sums=("bee1579fa646b18ff5c16133655f90cf37f013e3177aa35722e919d70c24dc2d")

build() {
  cd "$_reponame-$pkgver"

  cmake -B build \
  -DCMAKE_INSTALL_PREFIX='/usr'

  make -C build
}

package() {
  cd "$_reponame-$pkgver"

  make -C build DESTDIR="$pkgdir/" install
}
