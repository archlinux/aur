# Maintainer: BrainDamage
pkgname="termtrack-git"
pkgver=0.7.0
pkgrel=1
pkgdesc="Track orbiting objects (such as the International Space Station) in your terminal"
arch=(any)
url="https://github.com/trehn/termtrack"
license=("GPL")
depends=("python" "python-click" "python-pillow" "python-pyephem" "python-requests" "python-pyephem" "python-pyshp")
optdepends=()
sha256sums=("SKIP")
source=("git+https://github.com/trehn/termtrack")

pkgver() {
	cd "$srcdir/termtrack"
	git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
}


package() {
	cd "$srcdir/termtrack"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}
