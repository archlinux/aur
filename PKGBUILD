# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=python-zgitignore
pkgver=0.8.0
pkgrel=1
pkgdesc="Check if a file is ignored by a .zgitignore file, compatible with .gitignore syntax"
url="https://github.com/zb3/zgitignore"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/8d/ab/4dbba4077f232ed0651619c96dbda30bedb72066a074c94b24100d0dc579/zgitignore-${pkgver}.tar.gz")
sha256sums=('d35d009b42831a2010423a0dbf7ffaed11935b455511d42ec009486cee312153')

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
