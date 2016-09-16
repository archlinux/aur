# Maintainer: Mike Redd <mredd -at- zerotuezero dot com>

pkgname=go-tool-git
_pkgname=go
pkgver=1
pkgrel=1
pkgdesc="Small shell command for changing directories quickly"
arch=('i686' 'x86_64')
url="https://github.com/trentm/go-tool/"
license=('MIT')
depends=('python2')
makedepends=('git')
provides=('go-tool')
source=()
install=go-tool.install
source=('git+https://github.com/trentm/go-tool.git')
sha256sums=('SKIP')

package() {
  cd $srcdir/go-tool
  sed -i 's/python/python2/' Makefile.py
  sed -i 's/python/python2/' setup.py
  sed -i 's/python/python2/' lib/$_pkgname.py
  python2 setup.py build
  python2 setup.py install --prefix=$pkgdir/usr

}
