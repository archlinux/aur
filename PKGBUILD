# Maintainer: somini <dev@somini.xyz>

pkgbase=python-libinput
pkgname=python-libinput
_module='python-libinput'
pkgver=0.1.0
pkgrel=2
pkgdesc="Object-oriented wrapper for libinput using ctypes"
url="https://github.com/OzymandiasTheGreat/python-libinput"
depends=('python' 'libinput')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('e6b20e7fd889001fe74b01a1ff456e5f53c9ed01b016d6ceb65b6f573f129758')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
