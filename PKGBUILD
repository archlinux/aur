pkgbase='python2-pyttsx'
pkgname=('python2-pyttsx')
_module='pyttsx'
pkgver='1.1'
pkgrel=1
pkgdesc="pyttsx - cross platform text-to-speech"
url="https://github.com/parente/pyttsx"
depends=('python2')
makedepends=('python2-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('f435937d8c30e30f8fe034030e4ecbd0a69c3eaa4205e7280d5c9e19bf153df6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
