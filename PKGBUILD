# Maintainer: seiuneko <chfsefefgesfen foxmail>

pkgname=python-cowpy
_pkgname=cowpy
pkgver=1.1.5
pkgrel=1
pkgdesc='A cowsay clone for python in one file.'
arch=('any')
url='https://github.com/jeffbuttars/cowpy'
makedepends=('python-setuptools')
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jeffbuttars/cowpy/archive/${pkgver}.tar.gz")
sha512sums=('e8f6348d67ff46f84dee1a4586e6813e89d8d469a98b39314cb748229843d692f9d345196bc8397903f5580aff60e958c461133337dfe03d6a037113dc97c951')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
