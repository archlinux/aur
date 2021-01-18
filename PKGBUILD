# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>

_module='PLTable'
pkgname='python-pltable'
pkgver=1.0.2
pkgrel=1
pkgdesc="Python library for easily displaying tabular data in a visually appealing text table format"
arch=('any')
url='https://github.com/platomav/PLTable'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('1a34a9999ad74dcd3ba73dd602ff5853f699030d7a2e4a0469e9dacaf763bafc')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"

    # Install python packages to $pkgdir
    python setup.py install --root ${pkgdir} --skip-build
}
