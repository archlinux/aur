# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=mableandthewood-gog
pkgver=1.7
pkgrel=2
pkgdesc='Mable & The Wood (GOG version)'
arch=(x86_64)
url=https://mableandthewood.com
license=(custom:commercial)
provides=("${pkgname%-gog}")
conflicts=("${pkgname%-gog}")
depends=(openssl-1.0 libcurl-gnutls glu libxxf86vm libxrandr libglvnd libx11 libxext)
source=("${pkgname%-gog}.desktop" "${pkgname%-gog}" file://mable_the_wood_1_7_37606.sh)
b2sums=('c9974b0fd1b47ef7ff5c327260592cc3a993cd230a1fef5347c822dad185e084bf845140f40e994cebf445dab9616f7744f89a41ea8a5a80a2a96a4c026c4730'
        '6d67c0e4e2c1c0ef4dd27c02b8650301923df7e48536cf82d9cd9467e514a63f311e1b9ff0d1251eac3f2c18dfec3ce6970c28987689c60ca0948e9298d1ab79'
        'a0dc419c07d6a9cf909799550a656e8824a04288733f2450c2f56be5005b2d1c7579c30f246653fa8106e4a5a713c4c6e81b96d192a93be521841abf594c2fdc')

package() {
    install -Dm755 -t "$pkgdir/opt/${pkgname%-gog}" data/noarch/game/Mable_PC
    install -Dm644 -t "$pkgdir/opt/${pkgname%-gog}/assets" data/noarch/game/assets/{game.unx,options.ini}

    install -Dm755 -t "$pkgdir/usr/bin/" "${pkgname%-gog}"

    install -Dm644 -t "$pkgdir/usr/share/applications" "${pkgname%-gog}.desktop"
    install -Dm644 data/noarch/support/icon.png "$pkgdir/usr/share/pixmaps/${pkgname%-gog}.png"
    install -Dm644 "data/noarch/docs/End User License Agreement.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
