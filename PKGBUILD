# Maintainer:  Tristan Webb <tristan@fpcomplete.com>
pkgname=haskell-stack
_pkgname=stack
pkgver='0.1.0.0'
pkgrel=2
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
    sha1sums=('e7fc5e6b29788d3fb539364291a49eab036371c4')
elif [ "${CARCH}" = 'i686' ]; then
    _arch='i686'
    sha1sums=('1b4832d9a8bdab49b6453f34752b89d7aba68b3f')
fi
source=("http://download.fpcomplete.com/archlinux/${_pkgname}_${pkgver}-${_arch}.tar.gz")
# install=

package() {
  cd "$srcdir"
  STACK_BIN=usr/bin/stack
  install -Dm755 $STACK_BIN "$pkgdir/usr/bin/stack" 
  STACK_MAN_DIR=usr/share/man/man1
  install -Dm755 $STACK_BIN "$pkgdir/usr/bin/stack" 
  install -Dm755 $STACK_MAN_DIR/stack.1.gz "$pkgdir/$STACK_MAN_DIR/stack.1.gz" 
}

# vim:set ts=2 sw=2 et:
