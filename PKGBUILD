# Maintainer:  Tristan Webb <tristan@fpcomplete.com>
pkgname=haskell-stack
_pkgname=stack
pkgver='0.1.4.0'
pkgrel=1
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
    sha1sums=('2e31e1991782a505845d514b6c2e1ef5bfd24def')
elif [ "${CARCH}" = 'i686' ]; then
    _arch='i686'
    sha1sums=('1a0270381c7dcd2e866dd04f74520fb234392511')
fi
source=("https://s3.amazonaws.com/download.fpcomplete.com/archlinux/${_pkgname}_${pkgver}-${_arch}.tar.gz")
# install=

package() {
   cd "$srcdir"
   STACK_BIN=usr/bin/stack
   install -Dm755 $STACK_BIN "$pkgdir/usr/bin/stack"
   #STACK_MAN_DIR=usr/share/man/man1
   #gzip $STACK_MAN_DIR/stack.1
   #install -Dm644 $STACK_MAN_DIR/stack.1.gz "$pkgdir/$STACK_MAN_DIR/stack.1.gz"
   STACK_COMPLETION_DIR=etc/bash_completion.d
   install -Dm644 $STACK_COMPLETION_DIR/stack "$pkgdir/$STACK_COMPLETION_DIR/stack"
}

# vim:set ts=2 sw=2 et:
