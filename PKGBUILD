# Maintainer: Sebastian Markgraf <sebastian-markgraf@t-online.de>
pkgname=python-numerai-cli
pkgver=0.1.22
pkgrel=3
epoch=
pkgdesc="A library for helping to deploy a Numer.ai compute node"
arch=('any')
url="https://github.com/numerai/numerai-cli/"
license=('MIT')
groups=()
depends=("python" "python-setuptools" "python-boto3" "python-requests" "python-colorama" "python-click>=7" "python-numerapi")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/numerai/numerai-cli/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('8b3318b40d807d9d6dbec1d0e7f75c96')
validpgpkeys=()

build() {
	cd "numerai-cli-$pkgver"
	python setup.py build
}

check() {
	cd "numerai-cli-$pkgver"
}

package() {
	cd "numerai-cli-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
