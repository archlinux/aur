# Maintainer: Fabio Cantoni <cover@revoc.net>

pkgname=omafox
pkgver=1.0.0
pkgrel=1
pkgdesc='Synchronize the Firefox theme with Omarchy'
arch=('x86_64' 'aarch64')
url='https://github.com/cover/omafox'
license=('MIT')
depends=('bash' 'glibc')
optdepends=('firefox: runs the separately distributed Omafox extension')
install=omafox.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('31440738207e72ab3c80896f230dc0ed04a8b3831e8e7fc48b135de1f5f61fd6')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
