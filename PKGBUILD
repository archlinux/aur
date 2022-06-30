# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=python-cmakelang
_name=${pkgname#python-}
pkgver=0.6.13
pkgrel=1
pkgdesc="Language tools for cmake (format, lint, etc)"
arch=('any')
url="https://github.com/cheshirekow/cmake_format"
license=('GPL3')
groups=()
depends=("python-six" "python-yaml" "python-jinja")
makedepends=("python-setuptools")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
changelog=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('03982e87b00654d024d73ef972d9d9bb0e5726cdb6b8a424a15661fb6278e67f')

prepare() {
	cd "$_name-$pkgver"
	mkdir -p cmakelang/doc

	cp README.rst cmakelang/doc
}

build() {
	cd "$_name-$pkgver"

	python setup.py build
}

package() {
	cd "$_name-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
