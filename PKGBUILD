# Maintainer: Norbert Preining <norbert@preining.info>
# Contributor: Magnus Anderson <magnus@iastate.edu>
pkgname=px_ptop
pkgver=3.7.0
pkgrel=1
pkgdesc="ps and top for Human Beings"
arch=('any')
url="https://github.com/walles/px"
license=('MIT')
depends=('python')
source=("px-$pkgver.pex"::"https://github.com/walles/px/releases/download/$pkgver/px.pex")
noextract=("px-$pkgver.pex")
sha256sums=('63a50280244203905c5b2145aee8c591446470d92aaf169d9c893b09aa1c59c2')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	install -Dm755 px-$pkgver.pex "$pkgdir/usr/bin/px"
	ln -s px "$pkgdir/usr/bin/ptop"
	ln -s px "$pkgdir/usr/bin/pxtree"
	# Install license from latest github LICENSE
	curl -Ls https://raw.githubusercontent.com/walles/px/python/LICENSE > LICENSE
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
