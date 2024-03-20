pkgname=nestris-bin
pkgver=0.7
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
#_pkgrel_i386=1
#_pkgrel_i686=1
pkgdesc="Tetris NES powered by the Nestris reimplimentation engine."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/nestris-bin"
license=('GPL')
depends=('sdl2')
makedepends=('unzip')
sha256sums_x86_64=('SKIP' 'SKIP')
sha256sums_aarch64=('SKIP' 'SKIP')
#sha256sums_i386=('SKIP')
#sha256sums_i686=('SKIP')
source_x86_64=("https://gitlab.com/nestris-bin/binaries/$pkgver/-/raw/main/nestris-linux-x64.tar.xz"
"git+https://gitlab.com/nestris-bin/tetris")
source_aarch64=("https://gitlab.com/nestris-bin/binaries/$pkgver/-/raw/main/nestris-linux-arm64.tar.xz"
"git+https://gitlab.com/nestris-bin/tetris")
#source_i386=("")
#source_i686=("")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/applications"
    
    cp -r "$srcdir/nestris" "$pkgdir/usr/bin"
    cp -r "$srcdir/tetris/tetris.svg" "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/tetris/tetris.desktop" "$pkgdir/usr/share/applications"
}
