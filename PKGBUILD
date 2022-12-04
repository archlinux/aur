# Maintainer: RubenKelevra 

pkgname=python-multibase
_pkgname=py-multibase
pkgver=1.0.3
pkgrel=2
pkgdesc="Multibase implementation for Python (no active development)"
url="https://github.com/multiformats/py-multibase"
depends=('python'
	 'python-six'
         'python-morphys'
         'python-baseconv')
license=('MIT')
arch=('any')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('291789d166cc076137df512f75b052f6cee2c8ea98f5fd46005246096d448fb932fef59b1f11c7f1e1f17ac7fd4eaa7cf022120b083323e588e240de48529f3e')

build() {
    cd $srcdir/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
