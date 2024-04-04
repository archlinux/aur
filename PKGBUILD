# Maintainer: Harsh Sharma <goharsh007 at gmail dot com>
pkgname=hyprnotify
pkgver=0.6.2
pkgrel=1
pkgdesc="A notification daemon with 'hyprctl notify' as its backend."
arch=(x86_64 aarch64)
url="https://github.com/codelif/hyprnotify"
license=('Apache-2.0')
depends=(hyprland)
makedepends=(go alsa-lib binutils)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1821d396b275714eb0f67e26332b244db49deb35e11b24391b6679cd4dffa8b2')

build() {
	cd "$pkgname-$pkgver"
  go build -v ./cmd/hyprnotify
  strip hyprnotify
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 hyprnotify $pkgdir/usr/bin/hyprnotify
}
