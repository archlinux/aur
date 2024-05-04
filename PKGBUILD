pkgname=srb2-bin
pkgver=2.2.13
pkgrel=1
pkgdesc="A 3D Sonic fan game based off of Doom Legacy aka Sonic Robo Blast 2."
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'libpng' 'libgme' "srb2-data" 'libopenmpt' 'miniupnpc')
url='https://gitlab.com/linuxbombay/srb2-bin/sonic-robo-blast-2'
_pkgrel_i686=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums_i686=('SKIP'
                 '84ea954d174e9d30943946c5c2cff745bfb5debc67b9bcc2ef73d9d3df8e043a')
sha256sums_x86_64=('SKIP'
                   'd7ad59bf28e0ae1374a13dd238ed219677cd659b9769d65ff03ac1792f5dfb78')
sha256sums_aarch64=('SKIP'
                    '75dac550b5d94e3d35804789450a714731da2c4b6121234a24c7c845fe218bd8')
source_i686=("git+$url" "https://gitlab.com/linuxbombay/srb2-bin/binaries/$pkgver/-/raw/main/srb2-linux-i686.tar.xz")
source_x86_64=("git+$url" "https://gitlab.com/linuxbombay/srb2-bin/binaries/$pkgver/-/raw/main/srb2-linux-x64.tar.xz")
source_aarch64=("git+$url" "https://gitlab.com/linuxbombay/srb2-bin/binaries/$pkgver/-/raw/main/srb2-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/applications"
    
    install -Dm655 "$srcdir/sonic-robo-blast-2/srb2.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/sonic-robo-blast-2/srb2.desktop" "$pkgdir/usr/share/applications"
    install -m775 "$srcdir/srb2" "$pkgdir/usr/bin"
}
