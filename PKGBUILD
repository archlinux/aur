# Maintainer:  Tristan Webb <tristan@fpcomplete.com>
pkgname=haskell-stack
_pkgname=stack
pkgver='0.0.2'
pkgrel=1
pkgdesc="The Haskell Tool Stack"
arch=('x86_64' 'i686')
url="https://www.github.com/commercialhaskell/stack"
license=('BSD3')
depends=('libtinfo')
makedepends=()
optdepends=('docker: Use Docker images to build your project in a temporary container')
provides=('haskell-stack')
conflicts=('haskell-stack-git')
if [ "${CARCH}" = 'x86_64' ]; then
    _arch='x86_64'
    sha1sums=('83181756388bd6523e078faa343fa5feafbb57e3')
elif [ "${CARCH}" = 'i686' ]; then
    _arch='i686'
    sha1sums=('7f15728014d1c8f5c6618df2f80cb47765bb390f')
fi
source=("http://download.fpcomplete.com/archlinux/${_pkgname}_${pkgver}-${_arch}.tar.gz")
# install=

package() {
  cd "$srcdir"
  STACK_BIN=usr/bin/stack
  install -Dm755 $STACK_BIN "$pkgdir/usr/bin/stack" 
}

# vim:set ts=2 sw=2 et:
