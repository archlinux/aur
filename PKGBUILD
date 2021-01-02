# Mantainer: Jose Riha <jose1711 gmail com>

pkgname=python-cheap_repr
_module='cheap_repr'
pkgver=0.4.4
pkgrel=1
pkgdesc="Better version of repr/reprlib for short, cheap string representations."
url="http://github.com/alexmojaki/cheap_repr"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('181ea3731b9a056ba31184f3e0de7dd9d593a84978d3a5b1ab98ef7c1c1bfd08')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
