# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Barfin

_base=green-tunnel
pkgname=${_base}-bin
pkgver=2.0.2
pkgrel=2
pkgdesc="Anti-censorship utility that bypasses ISPs' deep packet inspection"
arch=('x86_64')
url="https://github.com/SadeghHayeri/GreenTunnel"
license=('MIT')
provides=('green-tunnel')
conflicts=('green-tunnel')
depends=('nss' 'gtk3' 'libxss')
options=('!emptydirs')
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$_base-debian.zip")
b2sums=('aeefd3782344e9c8203d601195ac20a09b2a11069710d5d20b731e3b2a30d251e0a804bf91a3fdde6848da6630042e5dcc3c2f8803a294d1f0b6c97fd9d67789')

prepare() {
	ar x "${_base}_1.7.5_amd64.deb"
}

package() {
	tar xf data.tar.xzt -C "$pkgdir/"
	install -Dm 644 "$pkgdir"/usr/share/doc/$_base/copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
