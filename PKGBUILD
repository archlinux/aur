pkgname=adventuresofdemo
_pkgname=AdventuresofDemo
pkgver=1.3.6.6
pkgrel=2
pkgdesc="This is a small game based on the TheXTech engine with the A2XT content pack made by the Talkhaus community. It's a remix of old SMBX episodes such as The Invasion 1, brought to the A2XT universe!"
arch=('pentium4' 'i386' 'i686' 'x86_64' 'aarch64')
url="https://github.com/Wohlstand/TheXTech"
license=('GPL')
depends=('thextech-bin' 'wget' 'unzip' 'yad')
makedepends=('unzip')
source=("adventuresofdemo.desktop" "adventuresofdemo.png" "$url/releases/download/v$pkgver/thextech-adventure-of-demo-assets-full-v$pkgver.7z")
sha256sums=('0cd889d2cd2ae76b6dfd9459fb73488f6d73c1448d5364bb788370bef08df5a6'
            '39e27070ffa35406cf4b660bf066f706693c7a65c930254acc6fefd89b852110'
            '32b45400148ce71290356b72d3967070f79d133eeb7f80a3c9bca78346003577')

package() {
    install -dm775 "$pkgdir/usr/games/thextech/assets/aod"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm644 "$pkgdir/usr/share/applications"

    # Packaging files
    cd "$srcdir"
    rm -rf thextech-adventure-of-demo-assets-full-v$pkgver.7z
    install -Dm755 "adventuresofdemo.desktop" "$pkgdir/usr/share/applications"
    install -Dm644 "adventuresofdemo.png" "$pkgdir/usr/share/pixmaps"
    cp -r * "$pkgdir/usr/games/thextech/assets/aod"
}
