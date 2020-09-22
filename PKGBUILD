# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sebastian Markgraf <sebastian-markgraf@t-online.de>
pkgname=python-numerapi
pkgver=2.3.4
pkgrel=1
epoch=
pkgdesc="Python API and command line interface for the numer.ai machine learning competition"
arch=('any')
url="https://github.com/uuazed/numerapi"
license=('MIT')
groups=()
depends=("python" "python-setuptools" "python-dateutil" "python-pytz" "python-tqdm" "python-click>=7")
makedepends=()
checkdepends=("python-pytest" "python-responses" "python-pytest-cov" "python-codecov")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/uuazed/numerapi/archive/$pkgver.tar.gz")
md5sums=('4279f7857916b96fa6fd876c0f8f62f7')
noextract=()
validpgpkeys=()

build() {
	cd "numerapi-$pkgver"
	python setup.py build
}

check() {
	cd "$srcdir/numerapi-$pkgver"
}

package() {
	cd "numerapi-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
