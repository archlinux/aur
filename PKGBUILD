# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('tracktime')
pkgname=('tracktime')
_module='tracktime'
pkgver='0.9.3'
pkgrel=1
pkgdesc='Time tracking library with command line interface.'
url='https://gitlab.com/sumner/tracktime'
depends=(
    'python'
    'python-pdfkit'
    'python-tabulate'
    'python-docutils'
    'python-requests'
    'python-yaml'
)
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=('https://files.pythonhosted.org/packages/source/t/tracktime/tracktime-0.9.3.tar.gz')
sha256sums=('0d7abbe3b6c86c7c511d3cb57a3915596c245598cdda496c716932c6d027c6e1')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
