# Maintainer: Anselmo L. S. Melo <anselmolsm@gmail.com>
_pkgname=v4l2
pkgname=python-$_pkgname
pkgver=0.2
pkgrel=1
pkgdesc="Python v4l2"
arch=('any')
url="https://pypi.python.org/pypi/v4l2"
license=('GPL2')
depends=('python')
source=('https://pypi.python.org/packages/1f/3c/a4e9abe360c76c7268cde9e7fbf7164c357063b29debbf0d36836097318c/v4l2-0.2.tar.gz'
        '01-fix-list.patch')
md5sums=('63ad6c62d907d0a9d8efad9a66357451'
         'a717e57a890228b1a9adb2b648a2ae7c')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
    patch -p0 < $srcdir/01-fix-list.patch
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python3 setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python3 setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# vim:set sw=2 et:
