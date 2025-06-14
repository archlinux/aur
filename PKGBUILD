# Maintainer: Norbert Preining <norbert@preining.info>
# Contributor: Magnus Anderson <magnus@iastate.edu>
pkgname=px_ptop
pkgver=3.6.12
pkgrel=1
pkgdesc="ps and top for Human Beings"
arch=('any')
url="https://github.com/walles/px"
license=('MIT')
depends=('python')
source=("px-$pkgver.pex"::"https://github.com/walles/px/releases/download/$pkgver/px.pex")
noextract=("px-$pkgver.pex")
sha256sums=('bc81691e89c4617ff9e8b7a99ac5e65611c5484b213c3c22a43e28ec0e68e2de')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	install -Dm755 px-$pkgver.pex "$pkgdir/usr/bin/px"
	ln -s px "$pkgdir/usr/bin/ptop"
	ln -s px "$pkgdir/usr/bin/pxtree"
	# Install license from latest github LICENSE
	curl -Ls https://raw.githubusercontent.com/walles/px/python/LICENSE > LICENSE
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
