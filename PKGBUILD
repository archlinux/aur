# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=wgroute
pkgver=1.0.1
pkgrel=1
pkgdesc="A tiny script to use if you want to route all of your packets through WireGuard without wg-quick"
arch=('any')
url="https://github.com/ckiee/wgroute"
license=('MIT')
depends=('iproute2' 'wireguard-tools')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ckiee/wgroute/archive/$pkgver.tar.gz")
sha256sums=('e9d65aaa36560dd21f552b9755552a079e8e7c6118a75629dd7f430b53a387eb')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
