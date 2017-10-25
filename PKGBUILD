#Maintainer: jnanar <info@agayon.be>

pkgname=python2-txjsonrpc-git
pkgver=0.0.1
pkgrel=1
pkgdesc="txJSON-RPC allows you to create async Python JSON-RPC servers and clients either over HTTP or directly on TCP with the Netstring protocol. txJSON-RPC is written in Twisted."
arch=(any)
url="https://github.com/oubiwann/txjsonrpc"
license=('MIT')
depends=('python2')
makedepends=('git')
options=(!emptydirs)
#optdepends=('')

source=('git+https://github.com/oubiwann/txjsonrpc.git')
_gitname="txjsonrpc"

md5sums=('SKIP')


#pkgver() {
#  cd $_gitname
#  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}


package() {

  cd "$srcdir/$_gitname"

  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
