# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('tracktime')
pkgname=('tracktime')
_module='tracktime'
pkgver='0.9.7'
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
source=('https://files.pythonhosted.org/packages/source/t/tracktime/tracktime-0.9.7.tar.gz')
sha256sums=('a59bc9c9a64025c8ad2ab9e3b059fcd84079b780fd2868339e81d8a68ba22649')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
