# Maintainer: Harsh Sharma <goharsh007 at gmail dot com>
pkgname=hyprnotify
pkgver=0.7.0
pkgrel=1
pkgdesc="A notification daemon with 'hyprctl notify' as its backend."
arch=(x86_64 aarch64)
url="https://github.com/codelif/hyprnotify"
license=('Apache-2.0')
depends=(hyprland)
makedepends=(go alsa-lib binutils)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('021e641b2be7cafedd4d7e605c10bb6ca51ef4d9192d496f690a123492db8b4f')

build() {
	cd "$pkgname-$pkgver"
  go build -v ./cmd/hyprnotify
  strip hyprnotify
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 hyprnotify $pkgdir/usr/bin/hyprnotify
}
