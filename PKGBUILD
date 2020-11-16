# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='tracktime'
pkgname=('tracktime')
_module='tracktime'
pkgver='0.9.17'
pkgrel=1
pkgdesc='Time tracking library with command line interface.'
url='https://git.sr.ht/~sumner/tracktime'
depends=(
    'python'
    'python-argcomplete'
    'python-docutils'
    'python-pdfkit'
    'python-requests'
    'python-tabulate'
    'python-yaml'
)
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=('https://files.pythonhosted.org/packages/source/t/tracktime/tracktime-0.9.17.tar.gz')
sha256sums=('10e4a30d8f05a7a2fbb6870d3d55e81a457267e95c6079747c313a4ecb08f33a')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
