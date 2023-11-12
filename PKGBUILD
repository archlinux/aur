# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Mike Swanson	<mikeonthecomputer@gmail.com>

pkgname=ttf-mononoki
pkgver=1.6
pkgrel=2

pkgdesc="Monospace font for programmers, successor of monoOne"
arch=('any')
url="https://madmalik.github.io/mononoki/"
license=('custom:OFL')

provides=("ttf-mononoki")
conflicts=("ttf-mononoki-git")
options=(strip emptydirs zipman)
changelog="changelog.md"

source=("$pkgname-$pkgver.tar.gz::https://github.com/madmalik/mononoki/archive/$pkgver.tar.gz")
b2sums=('584bf6d1f319fd15b30fcc2dc1f3c58e76105b1ca3cd6a02982e80c2df645b9861878dbfa0eb52768c3dfd2900ff30b59a3fad7e77a2785dc08087668cf54931')

package() {
	cd mononoki-$pkgver
	install -dm755 "$pkgdir/usr/share/fonts/ttf-mononoki"
	install -m644 -t "$pkgdir/usr/share/fonts/ttf-mononoki" export/*.ttf
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
