# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=python-pygls
_name=${pkgname#python-}
pkgver=0.9.0
pkgrel=1
pkgdesc="Pythonic generic implementation of the Language Server Protocol"
arch=('any')
url="https://github.com/openlawlibrary/pygls"
license=('APACHE')
groups=()
depends=("bandit" "flake8")
makedepends=("python-sphinx" "python-sphinx_rtd_theme" "python-setuptools")
checkdepends=("python-mock" "python-pytest" "python-pytest-asyncio")
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
sha256sums=("0be0dce93745cba445b7a2568910ca7e45a3865347f01860eff9ed3e37e64e7b")

build() {
	cd "$_name-$pkgver"

	python setup.py build
}

package() {
	cd "$_name-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
