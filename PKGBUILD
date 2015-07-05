# Maintainer:  Tristan Webb <tristan@fpcomplete.com>
pkgname=haskell-stack
_pkgname=stack
pkgver='0.1.1.0'
pkgrel=3
pkgdesc="The Haskell Tool Stack"
arch=('x86_64')
url="https://www.github.com/commercialhaskell/stack"
license=('BSD3')
depends=('libtinfo')
makedepends=()
optdepends=('docker: Use Docker images to build your project in a temporary container')
provides=('haskell-stack')
conflicts=('haskell-stack-git')
if [ "${CARCH}" = 'x86_64' ]; then
    _arch='x86_64'
    sha1sums=('62109910c250cc895ae20c1501c310fd6ff23418')
fi
source=("https://s3.amazonaws.com/download.fpcomplete.com/archlinux/${_pkgname}_${pkgver}-${_arch}.tar.gz")
# install=

package() {
  cd "$srcdir"
  STACK_BIN=usr/bin/stack
  install -Dm755 $STACK_BIN "$pkgdir/usr/bin/stack" 
  STACK_MAN_DIR=usr/share/man/man1
  install -Dm755 $STACK_BIN "$pkgdir/usr/bin/stack" 
  gzip $STACK_MAN_DIR/stack.1
  install -Dm755 $STACK_MAN_DIR/stack.1.gz "$pkgdir/$STACK_MAN_DIR/stack.1.gz" 
}

# vim:set ts=2 sw=2 et:
