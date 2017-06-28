# Maintainer: Hideaki Takahashi <mymelo+aur@gmail.com>
python=python

_libname=outbox
pkgname=python-$_libname
pkgver=0.1.8
pkgrel=2
pkgdesc="SMTP client for Humans"
arch=('any')
source=(https://pypi.python.org/packages/source/o/${_libname}/${_libname}-${pkgver}.tar.gz)
md5sums=('e710a8ce23dcac0e799a283e7bff17f3')

url="https://github.com/nathan-hoad/outbox"
license=("BSD")

build() {
    cd $srcdir/$_libname-$pkgver

    $python setup.py build || return 1
}

package() {
    cd $srcdir/$_libname-$pkgver

    $python setup.py install --root=$pkgdir

    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
