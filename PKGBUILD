# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Barfin

_base=green-tunnel
pkgname=${_base}-bin
pkgver=1.8.3
pkgrel=5
pkgdesc="Anti-censorship utility that bypasses ISPs' deep packet inspection"
arch=('x86_64')
url="https://github.com/SadeghHayeri/GreenTunnel"
license=('MIT')
provides=('green-tunnel')
conflicts=('green-tunnel')
depends=('nss' 'gtk3' 'libxss')
options=('!emptydirs')
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$_base-debian.zip")
sha256sums=('d00a6f4e43993a4b8c96546a3a8afbe04a5d11d0d65ab9dcc5137b0b6857f3dc')

prepare() {
	ar x "${_base}_1.7.5_amd64.deb"
}

package() {
	tar xf data.tar.xz -C "$pkgdir/"
	install -Dm 644 "$pkgdir"/usr/share/doc/$_base/copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
