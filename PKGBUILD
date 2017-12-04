# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>

pkgbase=python2-lzo
pkgname=(python-lzo python2-lzo)
pkgver=1.11
pkgrel=5
pkgdesc="Python bindings for the LZO data compression library"
arch=('x86_64')
url="https://pypi.python.org/pypi/python-lzo"
license=('GPL2')
makedepends=('git' 'python2' 'python')
source=("git+https://github.com/jd-boyd/python-lzo.git#commit=7b7ffb889dc65d6af693422e1c06a15d0bb0a1c5")
sha256sums=('SKIP')

prepare() {
  cp -a python-lzo python2-lzo
}

build() {
  cd "$srcdir"/python-lzo
  python setup.py build

  cd "$srcdir"/python2-lzo
  python2 setup.py build
}

package_python-lzo() {
  depends=('python')

  cd "$srcdir"/python-lzo
  python setup.py install --root "$pkgdir"
}

package_python2-lzo() {
  depends=('python2')

  cd "$srcdir"/python2-lzo
  python2 setup.py install --root "$pkgdir"
}
