# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='tracktime'
pkgname=('tracktime')
_module='tracktime'
pkgver='0.9.19'
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
source=('https://files.pythonhosted.org/packages/source/t/tracktime/tracktime-0.9.19.tar.gz')
sha256sums=('887b215933d3217e33b42d8441e589fdf6fff08d5fe6afde340e8913823094aa')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
