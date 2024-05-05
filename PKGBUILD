pkgname=srb2kart-bin
pkgver=1.6
pkgrel=1
pkgdesc="SRB2Kart is a kart racing mod based on the 3D Sonic the Hedgehog fangame Sonic Robo Blast 2, based on a modified version of Doom Legacy."
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'libpng' 'libgme' "srb2kart-data" 'libopenmpt' 'miniupnpc')
url='https://gitlab.com/linuxbombay/srb2-kart'
#_pkgrel_i686=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
#sha256sums_i686=('SKIP'
#'84ea954d174e9d30943946c5c2cff745bfb5debc67b9bcc2ef73d9d3df8e043a')
sha256sums_x86_64=('SKIP'
                   '06b5f6dae674eba3d9acb450d649d35d8b9b0745051cd960b7a7147fb1414f1b')
sha256sums_aarch64=('SKIP'
                    '72f9c921c0553f209cbaf52037f9e83caaf773c92ff5f99597800863788084d5')

#source_i686=("git+$url" "$url/binaries/$pkgver/-/raw/main/srb2kart-linux-i686.tar.xz")
source_x86_64=("git+$url/srb2-kart" "$url/binaries/$pkgver/-/raw/main/srb2kart-linux-x64.tar.xz")
source_aarch64=("git+$url/srb2-kart" "$url/binaries/$pkgver/-/raw/main/srb2kart-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/applications"
    
    install -Dm655 "$srcdir/srb2-kart/srb2kart.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/srb2-kart/srb2kart.desktop" "$pkgdir/usr/share/applications"
    install -m775 "$srcdir/srb2kart" "$pkgdir/usr/bin"
}
