# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-astroid
pkgver=1.6.6
pkgrel=1
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
sha512sums=('ad52f60862cd8554272804254b8fe8ca453d0adac1e535ef8b9107ef3e3b7c2eb922d487337f591b60304323a705a26bea8ee514819af02138c1029393514b9f')

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
