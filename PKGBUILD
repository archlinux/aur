# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-inkex'
pkgname=('python-inkex')
_module='inkex'
pkgver='1.3.1'
pkgrel=1
pkgdesc="Python extensions for Inkscape core, separated out from main repository."
url="https://gitlab.com/inkscape/extensions"
depends=('python' 'python-pillow' 'python-gobject' 'python-cssselect' 'python-lxml' 'python-numpy' 'python-packaging' 'python-pyserial' 'python-pyparsing' 'scour')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-poetry')
license=('GPL2')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('56217eace7e448952340672e9f2da52ae99f0f0bb5a2705a02dd665c6a8d6a0f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
