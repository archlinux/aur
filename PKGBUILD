# Maintainer: Harsh Sharma <goharsh007 at gmail dot com>
pkgname=hyprnotify
pkgver=0.8.0
pkgrel=1
pkgdesc="A notification daemon with 'hyprctl notify' as its backend."
arch=(x86_64 aarch64)
url="https://github.com/codelif/hyprnotify"
license=('Apache-2.0')
depends=()
makedepends=(go alsa-lib binutils)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f604868fd5aeef053a1e02e5642c81fb6d47351dedb030d88f24e5a27211c940')

build() {
	cd "$pkgname-$pkgver"
  go build -v ./cmd/hyprnotify
  strip hyprnotify
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 hyprnotify $pkgdir/usr/bin/hyprnotify
}
