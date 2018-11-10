# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('tracktime')
pkgname=('tracktime')
_module='tracktime'
pkgver='0.9.5'
pkgrel=1
pkgdesc='Time tracking library with command line interface.'
url='https://gitlab.com/sumner/tracktime'
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
source=('https://files.pythonhosted.org/packages/source/t/tracktime/tracktime-0.9.5.tar.gz')
sha256sums=('d51b280f0e7cb8641c5e1a2784b5fedda83dbc371824c3c614af0ee7060bc3dd')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
