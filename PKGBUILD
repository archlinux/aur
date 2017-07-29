# Maintainer: awe00 < awe00 AT hotmail DOT fr>
pkgname=protocol-git
pkgver=d450da7
pkgrel=1
pkgdesc="An ASCII Header Generator for Network Protocols"
arch=('any')
url="http://www.luismg.com/protocol/"
license=('GPL3')
depends=('python')
makedepends=('python')
provides=('protocol')
conflicts=('protocol')
source=("git+https://github.com/luismartingarcia/protocol")
md5sums=('SKIP')
_gitrepo=protocol

pkgver() {
  cd "$_gitrepo"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_gitrepo"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 $srcdir/$_gitrepo/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
