# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>
# If you find any problems with this package, submit an issue on the project's
# GitLab: https://gitlab.com/sumner/tracktime.

pkgbase=('tracktime')
pkgname=('tracktime')
_module='tracktime'
pkgver='0.9.2'
pkgrel=1
pkgdesc="Time tracking library with command line interface."
url="https://gitlab.com/sumner/tracktime"
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
source=("https://files.pythonhosted.org/packages/source/t/tracktime/tracktime-${pkgver}.tar.gz")
sha256sums=('ff0d4d2a4661c6916f3d0f41dbb8dd3a7121b0b4cba0e87100e51c46e271213a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
