pkgbase=('offlinemsmtp')
pkgname=('offlinemsmtp')
replaces=('python-offlinemsmtp')
_module='offlinemsmtp'
pkgver='0.3.1'
pkgrel=1
pkgdesc="msmtp wrapper allowing for offline use"
url="https://gitlab.com/sumner/offlinemsmtp"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/o/offlinemsmtp/offlinemsmtp-${pkgver}.tar.gz")
sha256sums=('28c7b8a58813e56be9b5e60c4d86a296c94f3a17f9546fd081f165377e91743d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
