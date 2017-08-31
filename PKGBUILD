# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=stack-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="The Haskell Tool Stack (tool only -- libraries not included)"
arch=(i686 x86_64)
url=https://hackage.haskell.org/package/stack
license=(BSD3)
depends=(gmp zlib)
provides=(stack)
conflicts=(stack)
source_i686=(https://github.com/commercialhaskell/stack/releases/download/v$pkgver/stack-$pkgver-linux-i386.tar.gz)
source_x86_64=(https://github.com/commercialhaskell/stack/releases/download/v$pkgver/stack-$pkgver-linux-x86_64.tar.gz)
sha256sums_i686=('2973f7baab2f557c113a92a560ad79b887bd57102e8f4a5caf67551a42ea4250')
sha256sums_x86_64=('b7df551c2f67464bebc5859fc0ecb2dc59cdbeb525af09e05ea4f2752828e542')

package() {
    cd "$srcdir/stack-$pkgver-linux-"*/
    install -Dm755 stack "$pkgdir/usr/bin/stack"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/stack/LICENSE"
}
