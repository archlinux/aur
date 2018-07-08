# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>
# If you find any problems with this package, submit an issue on the project's
# GitLab: https://gitlab.com/sumner/tracktime.

pkgbase=('tracktime')
pkgname=('tracktime')
_module='tracktime'
pkgver='0.1.1'
pkgrel=1
pkgdesc="Time tracking library with command line interface."
url="https://gitlab.com/sumner/tracktime"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/t/tracktime/tracktime-${pkgver}.tar.gz")
sha256sums=('fc7544ab2a8a3e59727e85350074210d1e736b34bd5c0474f84bfb93cc314855')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
