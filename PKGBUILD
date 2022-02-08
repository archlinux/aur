# Maintainer: Michal Wojdyla <micwoj9292 at gmail dot com>
# Contributor: loryeam <loryeam at gmail dot com>

pkgname=('python-python-magic')
_module='python-magic'
pkgver='0.4.25'
pkgrel=1
arch=('any')
url="http://github.com/ahupp/python-magic"
license=("MIT")
pkgdesc="File type identification using libmagic"
depends=('file' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('21f5f542aa0330f5c8a64442528542f6215c8e18d2466b399b0d9d39356d83fc')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
