# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Barfin

_base=green-tunnel
pkgname=${_base}-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Anti-censorship utility that bypasses ISPs' deep packet inspection"
arch=('x86_64')
url="https://github.com/SadeghHayeri/GreenTunnel"
license=('MIT')
provides=('green-tunnel')
conflicts=('green-tunnel')
depends=('nss' 'gtk3' 'libxss')
options=('!emptydirs')
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$_base-debian.zip")
b2sums=('9fc8126f72d2ac76d5b295d62e76c3894b30ec34f632c8c8937dfd87438f6e304a555faead7fd40bfbc7add8abadfec04bdca53ff81ba87e36ad6d68cb802143')

prepare() {
	ar x "${_base}_1.7.5_amd64.deb"
}

package() {
	tar xf data.tar.xz -C "$pkgdir/"
	install -Dm 644 "$pkgdir"/usr/share/doc/$_base/copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
