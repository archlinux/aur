# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Barfin

pkgname=green-tunnel-bin
_pkg="${pkgname%-bin}"
pkgver=1.8.3
pkgrel=4
pkgdesc="Anti-censorship utility that bypasses ISPs' deep packet inspection"
arch=('x86_64')
url="https://github.com/SadeghHayeri/GreenTunnel"
license=('MIT')
provides=('green-tunnel')
depends=('nss' 'gtk3' 'libxss')
options=('!emptydirs')
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$_pkg-debian.zip")
sha256sums=('d00a6f4e43993a4b8c96546a3a8afbe04a5d11d0d65ab9dcc5137b0b6857f3dc')

prepare() {
	ar x "${_pkg}_1.7.5_amd64.deb"
}

package() {
	tar xf data.tar.xz -C "$pkgdir/"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	mv "$pkgdir/usr/share/doc/$_pkg/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
