# Maintainer: AntiCompositeNumber <anticompositenumber+aur@gmail.com>
pkgname=f1multiviewer-digiflag
pkgver=2.2_stable
pkgrel=1
pkgdesc="Adding a DigiFlag functionality to MultiViewer For F1"
arch=('any')
url="https://github.com/LapsTimeOFF/DigiFlag_F1MV"
license=('MIT')
depends=('f1multiviewer' 'electron' 'nodejs')
makedepends=()
optdepends=()
install=
changelog=
source=(
    "$pkgname-$pkgver::https://github.com/LapsTimeOFF/DigiFlag_F1MV/releases/download/v${pkgver//_/-}/F1MV-DigiFlag-linux-x64.zip"
    "f1multiviewer-digiflag.sh"
    "f1multiviewer-digiflag.desktop"
)
b2sums=('57e47bbbbedca1f510a0b6892433b0080b3fc4ecb5a97b5760b2d9bb8805ac9f1fc4e8e3f70627e5b69853b6df220ad3d793c07357e32bede564ea408b32b455'
        '996640c9866adf775cb6b8ecbb04840d29ca1ba9e4a65e69b0b99c7480b4ed28d0e55969d210aaca68b85a2f18ae0592ae30b8211d1fd291a918a7b9e8149f23'
        '8fd78bb18556365153e318fd035caba71fb6fd8706603b4467cf9ea1e510b506049c0337054e27a74bc51e6282fbf3ea4786befa349c1f00bc55298069e39b06')

build() {
    echo
}

package() {
    install -Dm755 f1multiviewer-digiflag.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 f1multiviewer-digiflag.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

    cd "F1MV-DigiFlag-linux-x64"
    install -d "$pkgdir/usr/share/$pkgname"
    cp -r resources/app/* "$pkgdir/usr/share/$pkgname/"

    install -Dm644 resources/app/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 resources/app/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
