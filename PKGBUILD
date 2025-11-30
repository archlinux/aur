# Maintainer: Mason Hummel <masonhummel08 at gmail dot com>
pkgname="universal-gcode-sender-platform"
pkgver="2.1.17"
pkgrel="1"
pkgdesc="Java based GRBL gcode sender"
url="https://github.com/winder/Universal-G-Code-Sender"
arch=("x86_64")
license=('GPL3')

source=("https://github.com/winder/Universal-G-Code-Sender/releases/download/v$pkgver/linux-x64-ugs-platform-app-$pkgver.tar.gz"
"UGS.desktop")
sha512sums=("4115252caeb3ebd0e9a525e83e9701a6656c5ae1f4cded94d8684c1c292a972babf24fd6574c0445a97dc920196826fc117cbbf7de265077c3d83551124321ea" 
"3488822e8cc32cbe0c4956ba5b3c0bf4f37940c0c8e083b0587309a6deba84eb71a5cabe02064e879fff596b95bb5b650a91d76855fb61422bf7c4ffc0634bf0")

prepare(){
    cd "$srcdir"
    tar -xf "linux-x64-ugs-platform-app-$pkgver.tar.gz"
}
package(){

    mkdir -p "$pkgdir/opt/ugsplatform/"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/bin"

    cp -r "$srcdir/ugsplatform-linux-x64" "$pkgdir/opt/ugsplatform"

    chmod +x "$pkgdir/opt/ugsplatform/ugsplatform-linux-x64/bin/ugsplatform"

    cp "UGS.desktop" "$pkgdir/usr/share/applications"
    chmod +x "$pkgdir/usr/share/applications/UGS.desktop"

    ln -s "/opt/ugsplatform/ugsplatform-linux-x64/bin/ugsplatform" "$pkgdir/usr/bin/ugsplatform"
}