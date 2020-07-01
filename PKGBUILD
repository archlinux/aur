# Maintainer: Ben Widawsky <ben@bwidawsk.net>
# Initially created with pip2arch: https://github.com/lclarkmichalek/pip2arch
pkgbase='python-b4'
pkgname=('python-b4')
_module='b4'
pkgver='0.5.1'
pkgrel=1
pkgdesc="A tool to work with public-inbox and patch archives"
url="https://git.kernel.org/pub/scm/utils/b4/b4.git"
depends=('python')
makedepends=('python-setuptools')
license=('GPL2')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('7f13f2239dd942f2d14f6edf4bc9139dd0c03b6f705af00cb10abc9007eccb15')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
