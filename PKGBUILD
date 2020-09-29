# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=python-pygls
_name=${pkgname#python-}
pkgver=0.9.1
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
sha256sums=("c21c942415457315f316c0b6c19d4c743fd2974d457e02a85472154c8f1b6399")

build() {
	cd "$_name-$pkgver"

	python setup.py build
}

package() {
	cd "$_name-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
