# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
pkgname=python-favicons
pkgver=0.0.9
pkgrel=1
epoch=
pkgdesc="Favicon generator for Python 3 with strongly typed sync & async APIs, CLI, & HTML generation"
arch=(any)
url="https://github.com/checktheroads/favicons"
license=('BSD')
groups=()
depends=('python' 'python-pillow' 'python-rich' 'python-svglib' 'python-typer')
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
md5sums=('19091796d3c4a339be590ed87875ee4c')
validpgpkeys=()

prepare() {
	cd "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver"
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	mkdir -p $pkgdir/usr/share/licenses/${pkgname}/
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/
}
