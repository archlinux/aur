# Contributor : Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: zoe <chp321 [at] gmail [dot] com>

pkgname=python2-socksipy-branch
pkgver=1.02
pkgrel=1
pkgdesc="Allows you to create TCP connections through a SOCKS proxy without any special effort"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://code.google.com/archive/p/socksipy-branch/"     
license=('BSD')
options=(!emptydirs)
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/socksipy-branch/SocksiPy-branch-${pkgver}.tar.gz")
md5sums=('83bf21bb48a880599ef0b88d47824fda')
sha256sums=('9a6e201fb02c998c3c4d289b7805eadd0ee192ed8b9fa084b69201b589b17773')

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
