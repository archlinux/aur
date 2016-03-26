# Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgname=('python-django-easy-thumbnails')
_module='easy-thumbnails'
pkgver='2.3'
pkgrel=1
pkgdesc="highly configurable thumbnail creation and caching"
url="http://github.com/SmileyChris/easy-thumbnails"
depends=('python-django>=1.4.2' 'python-pillow')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/e/easy-thumbnails/easy-thumbnails-${pkgver}.tar.gz")
sha256sums=('5ae57f086026dbfe4aa59e9bc80bcae1ae6daca63dec02a2d510c3ab098f0de2')

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
