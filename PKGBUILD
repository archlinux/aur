pkgname=srb2-bin
pkgver=2.2.13
pkgrel=1
pkgdesc="A 3D Sonic fan game based off of Doom Legacy aka Sonic Robo Blast 2."
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'libpng' 'libgme' "srb2-data" 'libopenmpt')
url='https://gitlab.com/srb2-bin/sonic-robo-blast-2'
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums_x86_64=('SKIP' 'SKIP')
sha256sums_aarch64=('SKIP' 'SKIP')
source_x86_64=("git+$url" "https://gitlab.com/srb2-bin/binaries/$pkgver/-/raw/main/srb2-linux-x64.tar.xz")
source_aarch64=("git+$url" "https://gitlab.com/srb2-bin/binaries/$pkgver/-/raw/main/srb2-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/applications"
    
    install -Dm655 "$srcdir/sonic-robo-blast-2/srb2.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/sonic-robo-blast-2/srb2.desktop" "$pkgdir/usr/share/applications"
    install -m775 "$srcdir/srb2" "$pkgdir/usr/bin"
}
