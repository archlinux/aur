pkgbase=('python2-ezfreecad')
pkgname=('python2-ezfreecad')
_module='ezFreeCAD'
pkgver='0.11'
pkgrel=1
pkgdesc="Python wrapper for interfacing with FreeCAD; makes it easier to draw 3D objects programmatically"
url="https://github.com/AFMD/ezFreeCAD"
depends=('python2' 'freecad')
makedepends=('python2-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/e/ezfreecad/ezFreeCAD-${pkgver}.tar.gz")
md5sums=('14699f2af178b11a1053fcc2a13600b6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
