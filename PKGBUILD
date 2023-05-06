# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname=python-multibase
_module=${pkgname#python-}
pkgver=1.0.3
pkgrel=4
pkgdesc="Multibase implementation for Python (no active development)"
url="https://github.com/multiformats/py-multibase"
depends=('python>=3.11'
	 'python-six'
         'python-morphys'
         'python-baseconv')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${_module}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('291789d166cc076137df512f75b052f6cee2c8ea98f5fd46005246096d448fb932fef59b1f11c7f1e1f17ac7fd4eaa7cf022120b083323e588e240de48529f3e')

build() {
	mv "$srcdir/py-multibase-${pkgver}" "$srcdir/${_module}-${pkgver}"
	cd "$srcdir/${_module}-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/${_module}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=2 --skip-build
}
