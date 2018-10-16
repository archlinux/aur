pkgbase=('python2-ezfreecad')
pkgname=('python2-ezfreecad')
_module='ezFreeCAD'
pkgver='0.12'
pkgrel=1
pkgdesc="Python wrapper for interfacing with FreeCAD it make it easier to draw 3D objects programmatically"
url="https://github.com/AFMD/ezFreeCAD"
depends=('python2')
makedepends=('python2-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/e/ezfreecad/ezFreeCAD-${pkgver}.tar.gz")
md5sums=('320c6b23f90d1f397e6ba2bc77f688d3')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

