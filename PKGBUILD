pkgbase=('offlinemsmtp')
pkgname=('offlinemsmtp')
replaces=('python-offlinemsmtp')
_module='offlinemsmtp'
pkgver='0.2.3'
pkgrel=1
pkgdesc="msmtp wrapper allowing for offline use"
url="https://gitlab.com/sumner/offlinemsmtp"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/o/offlinemsmtp/offlinemsmtp-${pkgver}.tar.gz")
md5sums=('270b596c49109160c20e6e32f9a956d8')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
