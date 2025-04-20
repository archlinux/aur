# Maintainer: Mason Hummel <masonhummel08 at gmail dot com>
pkgname="universal-gcode-sender-platform"
pkgver="2.1.13"
pkgrel="1"
pkgdesc="Java based GRBL gcode sender"
url="https://github.com/winder/Universal-G-Code-Sender"
arch=("x86_64")
license=('GPL3')

source=("https://github.com/winder/Universal-G-Code-Sender/releases/download/v$pkgver/linux-x64-ugs-platform-app-$pkgver.tar.gz"
"UGS.desktop")
sha512sums=("c2e51b895493a03af2ba4dd330b6e7a113e11a28a6201d7b30681fd341c373f3001310e7dc3460fa8f93b03f1f6e53d1e58142e9b32c41c2462663464527c8f6" 
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