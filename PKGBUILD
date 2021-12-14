# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: zhullyb <zhullyb@outlook.com>

pkgname=python-html2md
pkgver=0.1.7
pkgrel=3
pkgdesc="HTML to Markdown converter"
license=('Apache')
arch=('any')
url="https://github.com/davidcavazos/html2md"
depends=('python-pyquery')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/h/html2md/html2md-$pkgver.tar.gz"
        'requirements.txt')
sha256sums=('d5deaab7c15271c12494df22c4f6566a93ea3c0649b7849e6f6c2d3982d7e65f'
            'aefdc3e1a9abe81be57e080798656ebb6d97854183f054381aa3192befb9968b')

prepare() {
	mv requirements.txt "html2md-$pkgver"
}

build() {
	cd "html2md-$pkgver"
	python setup.py build
}

check() {
	cd "html2md-$pkgver"
	python setup.py nosetests
}

package() {
	export PYTHONHASHSEED=0
	cd "html2md-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
