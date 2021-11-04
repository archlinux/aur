# Maintainer: tytan652 <tytan652@tytanium.xyz>

_reponame=obs-ptz
pkgname=$_reponame-controls
pkgver=0.10.1
pkgrel=1
pkgdesc="Plugin for OBS Studio to add a PTZ Camera control dock"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/ptz-controls.1284/"
license=("GPL2")
depends=("obs-studio" "qt5-gamepad" "qt5-serialport")
makedepends=("cmake")
source=("$_reponame-$pkgver.tar.gz::https://github.com/glikely/$_reponame/archive/v$pkgver.tar.gz")
sha256sums=("d36ffd044402661b320fdb0036719f8d764cdf28900cc48d4fbf5ffdc98b9bbe")

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
