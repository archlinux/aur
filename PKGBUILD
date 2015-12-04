# Maintainer:  Tristan Webb <tristan@fpcomplete.com>
pkgname=haskell-stack
_pkgname=stack
pkgver='0.1.10.0'
pkgrel=1
pkgdesc="The Haskell Tool Stack"
arch=('x86_64')
url="http://haskellstack.org"
license=('BSD3')
depends=('libtinfo')
makedepends=()
optdepends=('docker: Use Docker images to build your project in a temporary container'
            'ncurses5-compat-libs: Needed if using a bin dist of GHC compiled with libtinfo-5')
provides=('haskell-stack')
conflicts=('haskell-stack-git')
if [ "${CARCH}" = 'x86_64' ]; then
    _arch='x86_64'
    sha1sums=('7edaef19fd38f80170380ffa9223075539302615')
fi
source=("https://s3.amazonaws.com/download.fpcomplete.com/archlinux/${_pkgname}_${pkgver}-${_arch}.tar.gz")
# install=

package() {
   cd "$srcdir"
   find . -type f -perm +a+x -exec install -Dm755 '{}' $pkgdir/'{}' \;
   find . -type f -not -perm +a+x -exec install -Dm644 '{}' $pkgdir/'{}' \;
}

# vim:set ts=2 sw=2 et:
