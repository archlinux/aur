# Maintainer: João Miguel <jmcf125 at openmailbox dot org>
pkgname=ghc-raspbian-bin
pkgver=7.10.3
pkgrel=7
pkgdesc="GHC binaries for Raspberry Pi from Raspian repositories"
arch=('armv6h')
url="https://www.haskell.org/ghc/"
license=('custom')
conflicts=('ghc')
provides=(haskell-array haskell-base haskell-binary haskell-bin-package-db haskell-bytestring haskell-cabal haskell-containers haskell-deepseq haskell-directory haskell-filepath haskell-ghc-prim haskell-haskeline haskell-hoopl haskell-hpc haskell-integer-gmp haskell-pretty haskell-process haskell-template-haskell haskell-terminfo haskell-time haskell-transformers haskell-unix haskell-xhtml)
depends=(gcc gmp libffi perl)
makedepends=('dpkg')
install="${pkgname}.install"
_filename="ghc_${pkgver}-${pkgrel}+rpi1_armhf.deb"
source=("http://archive.raspbian.org/raspbian/pool/main/g/ghc/$_filename")
sha256sums=('6ed9c001044d1f200c5b0af7658e01ff2093210804ffe92d6d32e9aaa1f29353')

package() {
   echo '==> Extracting with dpkg. Note: packaging may take over 40 minutes.'
   dpkg -x "$srcdir/$_filename" "$pkgdir"
}
