pkgbase=('python2-ezfreecad')
pkgname=('python2-ezfreecad')
_module='ezFreeCAD'
pkgver='0.1'
pkgrel=1
pkgdesc="Python wrapper for interfacing with FreeCAD it make it easier to draw 3D objects programmatically"
url="https://github.com/AFMD/ezFreeCAD"
depends=('python2' 'freecad')
makedepends=('python2-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/e/ezfreecad/ezFreeCAD-${pkgver}.tar.gz")
md5sums=('60b738b7a85a2320fd1248f1d9b866f8')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
