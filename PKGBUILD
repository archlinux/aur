# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=python-zgitignore
pkgver=0.8.2
pkgrel=1
pkgdesc="Check if a file is ignored by a .zgitignore file, compatible with .gitignore syntax"
url="https://github.com/zb3/zgitignore"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/fc/15/85a0520545b0788e76768ae371dd5f9b6c7a71d5165cf31e2ac89b184080/zgitignore-${pkgver}.tar.gz")
sha256sums=('2af9b83afa1e8c3f9537812f7070dbe5d56b5c7d0bcda7bbf57d8e00201d6590')

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
