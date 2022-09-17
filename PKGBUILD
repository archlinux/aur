pkgname=splatplost-git
_pkgname="splatplost"
pkgdesc="A software-based SplatPost plotter."
pkgver=0.2.0.dev2.a4aa693
pkgrel=1
arch=('i686' 'x86_64')
conflicts=($_pkgname)
provides=($_pkgname)
url="https://github.com/Victrid/splatplost"
license=('GPL3')
depends=(
	"python-libnxctrl" "python-numpy" "python-pillow" "python-setuptools"
	"python-scipy" "python-tqdm" "python-scikit-image" "python-tsp-solver2"
	"python-pyqt6" "python-requests"
	"bluez-utils-compat"
)
optdepends=()
makedepends=()
source=('git+https://github.com/Victrid/splatplost.git#branch=dev-v0.2')
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "%s.%s" "$(python setup.py --version)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $_pkgname
	python setup.py install --root="$pkgdir/"  --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
