# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='tracktime'
pkgname=('tracktime')
_module='tracktime'
pkgver='0.9.12'
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
source=('https://files.pythonhosted.org/packages/source/t/tracktime/tracktime-0.9.12.tar.gz')
sha256sums=('0a35e4044e9005c403bc1645b1a636f842af96f726746a674f7fb3286b675cf1')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
