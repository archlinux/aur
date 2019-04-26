# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python2-v8
_pkgname=pyv8
pkgver=19632
pkgrel=2
pkgdesc="A Libemu Cython wrapper"
arch=('x86_64')
url="https://github.com/buffer/pyv8.git"
license=('GPL2')
depends=('python2' 'boost-libs')
makedepends=('git' 'v8')
source=("git+$url#commit=b5b0407" setup.diff)
sha256sums=('SKIP'
            '2eff2eeb95d14885e2309409d4e1150c93612a135445a486876d72cb1e91ee61')
makedepends=('python2' 'python-setuptools')

prepare() {
  cd ${_pkgname}
  patch -Np1 < "$srcdir"/setup.diff
  }
package() {
  cd ${_pkgname}
  python2 setup.py install --root="$pkgdir"
}
