# Maintainer: Felix Schindler <aut at felixschindler dot net>

pkgname=libtirpc-compat
pkgver=0.1
pkgrel=3
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
  for ii in $(cd /usr/include/tirpc/ && ls *.h); do
    ln -s /usr/include/tirpc/$ii "${pkgdir}"/usr/include/rpc/$ii
  done
  for ii in $(cd /usr/include/tirpc/rpc/ && ls *.h); do
    ln -s /usr/include/tirpc/rpc/$ii "${pkgdir}"/usr/include/rpc/$ii
  done
  ln -s /usr/include/tirpc/netconfig.h "${pkgdir}"/usr/include/netconfig.h
}


