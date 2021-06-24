pkgbase='python-kivy-garden-mapview'
pkgname=('python-kivy-garden-mapview')
_module='mapview'
pkgver='1.0.5'
pkgrel=1
pkgdesc="A kivy garden mapview demo."
url="https://github.com/kivy-garden/mapview"
depends=('python' 'python-kivy' 'python-requests')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c4f073c4cc0919b2411a354280473c3991838e79e15d11a4aa17023f270a3651')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
