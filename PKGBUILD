# Maintainer: Sebastian Morr <sebastian@morr.cc>

pkgname=scopes-bin
pkgver=0.13
pkgrel=1
pkgdesc="A retargetable programming language & infrastructure"
arch=('x86_64')
url="http://scopes.rocks"
license=('MIT')
depends=('ncurses')
makedepends=()
source=(https://bitbucket.org/duangle/scopes/downloads/scopes-$pkgver-glibc_2.23-linux-x86_64.tar.bz2)
sha256sums=('a050e5da113bc79d0b1b066d51d23931e9376dbd627c17d4091e3ac72912f869')

package() {
    cd scopes-$pkgver-glibc_2.23-linux-x86_64
    install -Dm755 bin/scopes $pkgdir/usr/bin/scopes
    install -Dm644 lib/scopes/core.sc $pkgdir/usr/lib/scopes/core.sc
    install -Dm644 lib/scopes/testing.sc $pkgdir/usr/lib/scopes/testing.sc
    install -Dm644 lib/scopes/FunctionChain.sc $pkgdir/usr/lib/scopes/FunctionChain.sc
    install -Dm644 lib/scopes/Array.sc $pkgdir/usr/lib/scopes/Array.sc
    install -Dm644 lib/scopes/glsl.sc $pkgdir/usr/lib/scopes/glsl.sc
    install -Dm644 lib/scopes/glm.sc $pkgdir/usr/lib/scopes/glm.sc
    ln -s /usr/lib/libtinfo.so.6 $pkgdir/usr/lib/libtinfo.so.5
}
