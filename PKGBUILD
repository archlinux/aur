# Maintainer: Felix Schindler <aut at felixschindler dot net>

pkgname=libtirpc-compat
pkgver=0.1
pkgrel=1
pkgdesc="Transport Independent RPC library (SunRPC replacement, backwards compatible links)"
arch=('x86_64')
url="http://libtirpc.sourceforge.net/"
license=('BSD')
depends=('libtirpc')
makedepends=('libtirpc')

build() {
  echo "nothing to do"
}

package() {
  mkdir -p "${pkgdir}"/usr/include/rpc
  cd "${pkgdir}"/usr/include/rpc
  for ii in $(ls /usr/include/tirpc/*); do
    ln -s ../tirpc/rpc/$ii .
  done
}

