# Maintainer:  Tristan Webb <tristan@fpcomplete.com>
pkgname=haskell-stack
_pkgname=stack
pkgver='0.0.3'
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
    sha1sums=('d3f3a4b4a57a4952e86f9baace6ed5d190fd6e21')
elif [ "${CARCH}" = 'i686' ]; then
    _arch='i686'
    sha1sums=('a3098f5a48151804bc350421f110d47e6e90938f')
fi
source=("http://download.fpcomplete.com/archlinux/${_pkgname}_${pkgver}-${_arch}.tar.gz")
# install=

package() {
  cd "$srcdir"
  STACK_BIN=usr/bin/stack
  install -Dm755 $STACK_BIN "$pkgdir/usr/bin/stack" 
}

# vim:set ts=2 sw=2 et:
