# Maintainer: Otreblan <otreblain@gmail.com>

_name=synthtiger
pkgname="python-$_name"
pkgver=1.2.1
pkgrel=1
pkgdesc="Synthetic text image generator for OCR model"
arch=('any')
url="https://github.com/clovaai/synthtiger"
license=('MIT')
groups=()
depends=(
	"python-arabic-reshaper"
	"python-blend-modes"
	"python-fonttools"
	"python-imgaug"
	"python-numpy"
	"python-opencv"
	"python-pillow"
	"python-pygame"
	"python-bidi"
	"python-pytweening"
	"python-yaml"
	"python-regex"
	"python-scipy"
)
makedepends=("python-build" "python-installer" "python-wheel")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('8e0d225b32d4748f9aaf39aff4dc7c93081a6cea5214b0b90b463dd074240950')

build() {
	cd "$srcdir/$_name-$pkgver"

	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
