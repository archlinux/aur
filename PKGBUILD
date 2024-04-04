# Maintainer: Harsh Sharma <goharsh007 at gmail dot com>
pkgname=hyprnotify
pkgver=0.6.1
pkgrel=1
pkgdesc="A notification daemon with 'hyprctl notify' as its backend."
arch=(x86_64 aarch64)
url="https://github.com/codelif/hyprnotify"
license=('Apache-2.0')
depends=(hyprland)
makedepends=(go alsa-lib binutils)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('27a5ed365e8b7c72e14715f719e0f13028dbd75fa3db71d5806f4f5f600ccb27')

build() {
	cd "$pkgname-$pkgver"
  go build -v ./cmd/hyprnotify
  strip hyprnotify
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 hyprnotify $pkgdir/usr/bin/hyprnotify
}
