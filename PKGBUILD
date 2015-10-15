# Maintainer:  Tristan Webb <tristan@fpcomplete.com>
pkgname=haskell-stack
_pkgname=stack
pkgver='0.1.6.0'
pkgrel=2
pkgdesc="The Haskell Tool Stack"
arch=('x86_64')
url="https://www.github.com/commercialhaskell/stack"
license=('BSD3')
depends=('libtinfo')
makedepends=()
optdepends=('docker: Use Docker images to build your project in a temporary container'
            'ncurses5-compat-libs: Needed if using a bin dist of GHC compiled with libtinfo-5')
provides=('haskell-stack')
conflicts=('haskell-stack-git')
if [ "${CARCH}" = 'x86_64' ]; then
    _arch='x86_64'
    sha1sums=('fe646c18e3851dcaa846af74350378ac5ab3b33d')
fi
source=("https://s3.amazonaws.com/download.fpcomplete.com/archlinux/${_pkgname}_${pkgver}-${_arch}.tar.gz")
# install=

package() {
   cd "$srcdir"
   find . -type f -perm +a+x -exec install -Dm755 '{}' $pkgdir/'{}' \;
   find . -type f -not -perm +a+x -exec install -Dm644 '{}' $pkgdir/'{}' \;
}

# vim:set ts=2 sw=2 et:
