# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='tracktime'
pkgname=('tracktime')
_module='tracktime'
pkgver='0.9.13'
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
source=('https://files.pythonhosted.org/packages/source/t/tracktime/tracktime-0.9.13.tar.gz')
sha256sums=('b6c9dda9feaa1f7107bca097460595260b920b5641d3fdad858a624309cf4af6')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
