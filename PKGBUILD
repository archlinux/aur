# Maintainer: gardar <aur@gardar.net>

pkgname=python-jsonnet
pkgver=0.20.0
pkgrel=1
pkgdesc="Python bindings for Google's Jsonnet - The data templating language"
arch=('i686' 'x86_64')
url="https://github.com/google/jsonnet"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('77bd269073807731f6b11ff8d7c03e9065aafb8e4d038935deb388325e52511b')

build() {
  cd "$srcdir/jsonnet-$pkgver"
  export CFLAGS="$CFLAGS -fPIC"
  export CXXFLAGS="$CXXFLAGS -fPIC"
  python setup.py build
}

package() {
  cd "$srcdir/jsonnet-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
