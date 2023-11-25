# Maintainer: Mathieu <mathieu@clabaut.net>
pkgbase='python-ofxhome'
pkgname=('python-ofxhome')
_module='ofxhome'
pkgver='0.3.3'
pkgrel=1
pkgdesc="ofxhome.com financial institution lookup REST client"
url="https://github.com/captin411/ofxhome"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('8510451fd228c30627c3d18c2e530df35944afc2a4c97c888df6262c3276fee6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
