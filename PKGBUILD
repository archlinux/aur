# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>

_module='PLTable'
pkgname='python-pltable'
pkgver=1.1.0
pkgrel=1
pkgdesc="Python library for easily displaying tabular data in a visually appealing text table format"
arch=('any')
url='https://github.com/platomav/PLTable'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('dc8eb7cb9721a7090dc7a5976fbec7d3ef6b82a61f86c3b98700571a3f10401a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"

    # Install python packages to $pkgdir
    python setup.py install --root ${pkgdir} --skip-build
}
