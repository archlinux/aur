pkgname=nestris-bin
pkgver=0.7
pkgrel=2
_pkgrel_x86_64=1
_pkgrel_aarch64=1
#_pkgrel_i386=1
#_pkgrel_i686=1
pkgdesc="Tetris NES powered by the Nestris reimplimentation engine."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/nestris-bin"
license=('GPL')
depends=('sdl2' 'yaml-cpp')
makedepends=('unzip')
sha256sums_x86_64=('9b0f734616c9f7c8768b713e1ca286719ea73cf376d2bc755f236edce13d29ad'
                   'SKIP')
sha256sums_aarch64=('5c1db080e8546d06da8b810d2c0c9a14ab35a331acfe67d52811b990ef1ef1ea'
                    'SKIP')
#sha256sums_i386=('SKIP')
#sha256sums_i686=('SKIP')
source_x86_64=("https://gitlab.com/linuxbombay/nestris-bin/binaries/$pkgver/-/raw/main/nestris-linux-x64.tar.xz"
"git+https://gitlab.com/linuxbombay/nestris-bin/tetris")
source_aarch64=("https://gitlab.com/linuxbombay/nestris-bin/binaries/$pkgver/-/raw/main/nestris-linux-arm64.tar.xz"
"git+https://gitlab.com/linuxbombay/nestris-bin/tetris")
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
