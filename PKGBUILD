# Maintainer: zayn7lie <zayn7lie.ber7+git@gmail.com>

pkgname="trezor-suite"
pkgver="25.11.3"
pkgrel=2
pkgdesc="The simplier, the safer. This AUR just install the pure AppImage."
arch=("x86_64")
options=(!strip !debug)
_pkgname="Trezor-Suite-$pkgver-linux-$arch"
url="https://github.com/trezor/trezor-suite"
license=("custom:T-RSL")
source=(
    "$_pkgname.AppImage::https://github.com/trezor/$pkgname/releases/download/v$pkgver/$_pkgname.AppImage" # safe AppImage from the official repo
    #"https://github.com/trezor/$pkgname/releases/download/v$pkgver/$_pkgname.AppImage.asc"
    "$pkgname" # Execute file, just execute the AppImage
    "$pkgname.desktop" # Desktop Entry, just execute the AppImage
    "$pkgname.png::https://raw.githubusercontent.com/trezor/trezor-suite/master/suite-native/app/assets/production/appIcon.png" # Icon from the official repo
    "LICENSE.md::https://raw.githubusercontent.com/trezor/trezor-suite/master/LICENSE.md" # LICENSE from the official repo
)
noextract=($_pkgname.AppImage)
sha512sums=(
    "d3436773bc58dec9cfe604b91b3b33804dcc553359ea3522538dc3ebc3f3e1a63380d68f9fc24cba1de40b4c9bc66e076879d9f440b812b69af54e603bc32adf"
    # echo '00Nnc7xY3snP5gS5GzszgE3MVTNZ6jUiU43D68Pz4aYzgNaPn8JMuh3kC0ybxm4HaHnZ9EC4Eraa9U5gO8Mq3w==' | base64 -d | od -An -tx1 | tr -d ' \n'
    "644da8513c9d3475f4f610376da885de20308d5cc458d01b1bf9d7613b009e82be3dd8ab0a2b875e309a374786127471da360920f8f8cc0aa17f613c135ce9fc"
    "9d26b0ca4878857c839f1604c63a50b89e3ecfaa03ad36b1b83a2a74a33636896c42ff22ed9434e9a54ab57e2ea2310305a5d062b0616b7ae64bbd3cc8b80748"
    "f12c122d7f297511cf6b2cf47e41d0a4c1ced4b6d0c34109646e977e51228a3e9249af00ff757da633df840a60e06b86f31e44dfd980876ab9b33139bed2d32c"
    "84ba4ab671d5ccc79d9463f01552cc7ff6b801a6a26a262048dd0be806a345974f618119dd24dae7966e9446cb3e1358d9022caa3d1ff88a6555c96b23793c05"
)

package() {
    cd $srcdir
    install -Dm755 $_pkgname.AppImage $pkgdir/opt/$pkgname/$pkgname.AppImage
    install -Dm755 -t $pkgdir/usr/bin $pkgname
    install -Dm644 -t $pkgdir/usr/share/applications/ $pkgname.desktop
    install -Dm644 -t $pkgdir/usr/share/icons/hicolor/512x512/apps/ $pkgname.png
    install -Dm644 -t $pkgdir/usr/share/licenses/$pkgname LICENSE.md
}
