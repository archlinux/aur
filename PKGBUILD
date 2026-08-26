# Maintainer: Fabio Cantoni <cover@revoc.net>

pkgname=omafox
pkgver=1.1.0
pkgrel=1
pkgdesc='Synchronize Firefox and Zen Browser themes with Omarchy'
arch=('x86_64' 'aarch64')
url='https://github.com/cover/omafox'
license=('MIT')
depends=('bash' 'glibc')
optdepends=(
  'firefox: runs the separately distributed Omafox extension'
  'zen-browser-bin: runs the separately distributed Omafox extension with Zen integration'
)
install=omafox.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b610174e19edf2940127761f2883a14e5ba8644bc42c75ead8148305c7caa4f9')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
