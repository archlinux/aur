# Maintainer: dreieck
# Contributor : Andy Weidenbaum <archbaum@gmail.com>
# Contributor: zoe <chp321 [at] gmail [dot] com>

pkgname=python2-socksipy-branch-1.01
pkgver=1.01
pkgrel=1
pkgdesc="Version 1.01 of SocksiPy, for compatibility reasons."
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
provides=("python2-socksipy=${pkgver}" "python2-socksipy-branch=${pkgver}")
conflicts=("python2-socksipy" "python2-socksipy-branch")
url="http://code.google.com/archive/p/socksipy-branch/"
license=('BSD')
options=(!emptydirs)
source=(
  "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/socksipy-branch/SocksiPy-branch-1.01.tar.gz"
)

sha256sums=(
  '8331732ed0fcacc84e7c33c07f5e3902f0869a215b3a56f0a8845d2fafbfd504'
)

build() {
  chmod -R 755 "$srcdir/SocksiPy-branch-$pkgver"
  cd "$srcdir/SocksiPy-branch-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/SocksiPy-branch-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
