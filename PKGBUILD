# Maintainer: Mason Hummel <masonhummel08 at gmail dot com>
pkgname="universal-gcode-sender-platform"
pkgver="2.1.9"
pkgrel="1"
pkgdesc="Java based GRBL gcode sender"
url="https://github.com/winder/Universal-G-Code-Sender"
arch=("x86_64")
license=('GPL3')

source=("https://github.com/winder/Universal-G-Code-Sender/releases/download/v2.1.9/linux-x64-ugs-platform-app-$pkgver.tar.gz"
"UGS.desktop")
sha512sums=("adc3938f7bfda1319cb4ab2777784a30186838fe4ebcfc7406b98b3205e682a203b44bdf500a512a005833d5e7fda05ff8ac9504b6b4ed6cd6e0eaf13435e985" 
"817f7d9f710356f7bd8e441ac673024b7e2ec95f8988f5dd69fde808356577984cce0ee07282f461af717b0466b28c1e58220a45a33f41a38db08b8aa337a22d")

prepare(){
    cd "$srcdir"
    tar -xf "linux-x64-ugs-platform-app-$pkgver.tar.gz"
}
package(){

    mkdir -p "$pkgdir/opt/ugsplatform/"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p $pkgdir/usr/bin

    cp -r "$srcdir/ugsplatform-linux-x64" "$pkgdir/opt/ugsplatform"
    
    chmod +x "$pkgdir/opt/ugsplatform/ugsplatform-linux-x64/bin/ugsplatform"
   
    cp "UGS.desktop" "$pkgdir/usr/share/applications"
    chmod +x "$pkgdir/usr/share/applications/UGS.desktop"

    ln -s "/opt/ugsplatform/ugsplatform-linux-x64/bin/ugsplatform" "$pkgdir/usr/bin/ugsplatform"
}