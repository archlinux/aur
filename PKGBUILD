# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-zenipy
_module=zenipy
pkgver=0.1.5
pkgrel=1
pkgdesc="Simple dialog with Python and Gtk"
url="http://github.com/poulp/zenipy"
depends=('python' 'zenity')
makedepends=('python-setuptools')
license=('WTPFL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c773c2e5022764b6f7efaf87256b4c73ab81d2452832126bb2bed6f7b1962cce')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
