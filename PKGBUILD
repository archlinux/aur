# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=python-zgitignore
pkgver=0.8.1
pkgrel=1
pkgdesc="Check if a file is ignored by a .zgitignore file, compatible with .gitignore syntax"
url="https://github.com/zb3/zgitignore"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/16/bb/703a253e7e5c5e8fb6cde531fc42420760d68aa12576cee8e7ae9be34ebe/zgitignore-${pkgver}.tar.gz")
sha256sums=('046484eb87e97be5afa6c6fd53fc34b840886e867954db4c2284489db75b8ede')

build() {
	cd "zgitignore-${pkgver}"
	python setup.py build
}

check() {
	cd "zgitignore-${pkgver}"
	python setup.py test
}

package() {
	cd "zgitignore-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1
}
