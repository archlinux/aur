# Maintainer: Leopold Fajtak <maintainer.u2dut@aleeas.com>
pkgbase='texbrix'
pkgname=('texbrix')
_module='TeXBriX'
pkgver='0.2.10'
pkgrel=1
pkgdesc="A granular approach to LaTeX"
url="http://github.com/leopoldfajtak/texbrix"
depends=('python')
makedepends=('python-setuptools')
license=('GPL-3.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('45c36114af1fda5fe6d1b73f51dbfd379d402e1fe9a8526207464ea9a2441340')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
