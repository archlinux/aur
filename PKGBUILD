# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=crowbar
pkgver=0.74
pkgrel=1
pkgdesc='GoldSource and Source Engine Modding Tool (Wine)'
arch=('x86_64')
url='https://github.com/ZeqMacaw/Crowbar'
license=('CCPL:by-sa3')
depends=('wine')
makedepends=('imagemagick')
_package=Crowbar_2023-02-16
source=($pkgname-$pkgver.7z::"$url/releases/download/v$pkgver/${_package}_$pkgver.7z"
        "https://raw.githubusercontent.com/ZeqMacaw/Crowbar/v$pkgver/Crowbar/Resources/crowbar_icon.ico"
        "$pkgname.desktop"
        "$pkgname.xml"
        "$pkgname")
sha256sums=('a33d16ea4894ec01686e53d01c6a2b8f816f4abdaead7ece41262e03ffa9c13f'
            '2acab642ad9956aa9940a017ccece5c305f88b6cb9e819917debe1be10fec804'
            '7be517ed49bce87c2893c6d6d13efd70a26606b24f20cff43679f81fc1bb2c13'
            '7350f67c9829c303d270d1d8c48d5d551a8e570826f89e5527e0e5df3705f917'
            '9f31f6e4099d907380f010e464f5e2ef875e615c6aa769c8dfe00591cf0f3b06')

prepare() {
        echo "! This package creates a directory '~/.local/share/wineprefixes/crowbar' in the home directory for a Wine prefix (if it doesn't exist)."
    sleep 2 && echo "Continuing the installation.." && sleep 2
    mkdir -p $HOME/.local/share/wineprefixes/crowbar

  convert crowbar_icon.ico -strip $pkgname.png
}

package() {
  install -Dm644 $pkgname-6.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 $pkgname-5.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 $pkgname-4.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/$pkgname.png"
  install -Dm644 $pkgname-3.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm644 $pkgname-2.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 $pkgname-1.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 $pkgname-0.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png"
  install -Dm644 $pkgname.xml -t "$pkgdir/usr/share/mime/packages"
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm755 Crowbar.exe "$pkgdir/usr/share/$pkgname/$pkgname.exe"
}
