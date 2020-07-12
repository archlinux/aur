# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-astroid
pkgver=1.6.5
pkgrel=3
pkgdesc="Useful miscellaneous modules used by Logilab projects"
arch=('any')
url="https://github.com/PyCQA/astroid"
license=('LGPL')
depends=('python2-six' 'python2-lazy-object-proxy' 'python2-wrapt'
         'python2-singledispatch' 'python2-enum34'
         'python2-backports.functools_lru_cache')
makedepends=('python2-setuptools')
checkdepends=('python2-dateutil' 'python2-pytest' 'python2-numpy' 'python2-nose')
replaces=('python2-logilab-astng')
conflicts=('python2-logilab-astng')
source=(https://github.com/PyCQA/astroid/archive/astroid-$pkgver.tar.gz)
sha512sums=('b08a178db78114cdaa02283dacd9aab63c3e2e0586d003d83de13ee362c539d36a9547d57baa561de475e168690e997de49210c122848ec60ffef943b9eaabc7')

build() {
  cd "$srcdir"/astroid-astroid-$pkgver
  python2 setup.py build
}

check() {
  cd "$srcdir"/astroid-astroid-$pkgver
  pytest2
}

package() {
  cd "$srcdir"/astroid-astroid-$pkgver
  python2 setup.py install --optimize=1 --skip-build --prefix=/usr --root="$pkgdir"
}
