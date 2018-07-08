pkgbase=('offlinemsmtp')
pkgname=('offlinemsmtp')
replaces=('python-offlinemsmtp')
_module='offlinemsmtp'
pkgver='0.3.0'
pkgrel=1
pkgdesc="msmtp wrapper allowing for offline use"
url="https://gitlab.com/sumner/offlinemsmtp"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/o/offlinemsmtp/offlinemsmtp-${pkgver}.tar.gz")
sha256sums=('3f87b3da6eb59db1b08dfda12b5ae0a3db9f0a2aff1042353df3ab89341695b2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
