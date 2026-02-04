# Maintainer: Sidharth Arya <code@sidhartharya.com>
pkgname=svcm
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight systemd service manager for Wayland"
arch=('x86_64')
url="https://github.com/SidharthArya/svcm"
license=('MIT')
depends=('systemd')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SidharthArya/svcm/archive/v$pkgver.tar.gz")
sha256sums=('SKIP') # Update this with actual sum when releasing

build() {
  cd "$pkgname-$pkgver"
  go build -o svcm ./src/cmd/svcm
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 svcm "$pkgdir/usr/bin/svcm"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
