pkgname=planetblupi-bin
pkgver=1.15.0
pkgrel=1
pkgdesc="Planet Blupi game"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/planetblupi/"
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'libpng' 'libogg' 'ffmpeg' 'libvorbis')
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums_x86_64=('SKIP'
                   '0abd54e842b801e5364de597fc1a54e4578730f31f86d6ea7fab2994327c4abe')
sha256sums_aarch64=('SKIP'
                    '5bc00034e5df96f453e2a8616252b583a6bc30abd7356558de3fd66ef73bb2a9')
source_x86_64=("git+$url" "https://gitlab.com/linuxbombay/planetblupi/binaries/$pkgver/-/raw/main/planetblupi-linux-x64.tar.xz")
source_aarch64=("git+$url" "https://gitlab.com/linuxbombay/planetblupi/binaries/$pkgver/-/raw/main/planetblubi-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/share"
    install -dm755 "$pkgdir/usr/share/games/PlanetBlupi"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/bin"
     
    cp -r "$srcdir/planetblupi/." "$pkgdir/usr/share/games/PlanetBlupi"
    cp -r "$srcdir/planetblupi/planetblupi" "$pkgdir/usr/bin"
    cp -r "$srcdir/planetblupi/planetblupi.desktop" "$pkgdir/usr/share/applications"
    cp -r "$srcdir/planetblupi/share/icons/hicolor/scalable/apps/blupi.svg" "$pkgdir/usr/share/pixmaps/planetblupi.svg"
}
