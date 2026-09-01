# shellcheck disable=SC2154
# Maintainer: Bas <hi@bas.sh>
pkgname=goat-cli-bin
pkgver=0.2.4 # renovate: datasource=github-tags depName=bluesky-social/goat
pkgrel=2
pkgdesc="Go AT protocol CLI tool"
arch=('x86_64')
url="https://github.com/bluesky-social/goat"
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bluesky-social/goat/releases/download/v$pkgver/goat_Linux_x86_64.tar.gz")
sha256sums=('f4168ce99a43c42491455e747f845b5a7347fe385046519e578c46dd74bba8f1')

package() {
	install -Dm755 goat "$pkgdir/usr/bin/goat"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
