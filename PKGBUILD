# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgbase='python-googletransx'
pkgname=('python-googletransx')
_module='googletransx'
pkgver='2.4.2'
pkgrel=1
pkgdesc="Free Google Translate API for Python. Translates totally free of charge."
url="https://github.com/x0rkov/py-googletrans"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c46567e3365c2abbe8af1004121b6303f530bf72025d1c3045ed14861902d6da')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    rm -rf $pkgdir/usr/bin/translate  # just library
}
