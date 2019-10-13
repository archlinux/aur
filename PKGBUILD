# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('tracktime')
pkgname=('tracktime')
_module='tracktime'
pkgver='0.9.9'
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
source=('https://files.pythonhosted.org/packages/source/t/tracktime/tracktime-0.9.9.tar.gz')
sha256sums=('79df55d54a2c73adc2044924341025a45da7c9ef53f1c9ae24f8a61048e6f9ba')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
