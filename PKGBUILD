# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-command-source
pkgver=0.2.1
pkgrel=2
pkgdesc="This plugin provides a dummy source to execute arbitrary command when scene is switched"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/dummy-source-to-execute-command.952/"
license=("GPL2")
depends=("obs-studio")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("692c6082659cdceb3eee28c458550496a8517493b9d26e1b3c546752cc779756")

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
