#Maintainer: jnanar <info@agayon.be>

pkgname=python2-txjsonrpc-git
pkgver=0.3.1.r20160319.5b7c241.
_version=0.3.1
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

pkgver() {
  cd $_gitname
  printf "$_version.r%s.%s" "$(git log -1 --format=%cd.%h --date=short|tr -d -)"

}

package() {

  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
