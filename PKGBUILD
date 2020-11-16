# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='tracktime'
pkgname=('tracktime')
_module='tracktime'
pkgver='0.9.18'
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
source=('https://files.pythonhosted.org/packages/source/t/tracktime/tracktime-0.9.18.tar.gz')
sha256sums=('a083b336945ce208d28173cf240b89b8e9adfceb145dfe82744c0ebef966cc99')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
