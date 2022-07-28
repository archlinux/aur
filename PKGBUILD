# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=dinit
pkgver=0.15.1
pkgrel=1
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=("$pkgname-$pkgver.tar.gz::https://github.com/davmac314/dinit/archive/v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('Apache')
makedepends=('make')
conflicts=('filesystem' 'systemd-sysvcompat')
depends=('git' 'pacman')
sha256sums=('b6cc489079a6600ae5f89cbc52b6046bd522e8e91da60c6a3006c4224cba83b4')

build () {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"
  
  make DESTDIR="$pkgdir/" install
}
