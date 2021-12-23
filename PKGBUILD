# Maintainer: Mark Stenglein <aur@markstenglein.com>
name=cross-code
pkgname=$name-bin
pkgver=1.3
pkgrel=1
pkgdesc="A retro-inspired 2D Action RPG set in the distant future. CrossCode combines 16-bit SNES-style graphics with butter-smooth physics, a fast-paced combat system, and engaging puzzle mechanics, served with a gripping sci-fi story."
arch=("x86_64")
url="https://www.cross-code.com"
license=('nonfree')
makedepends=()
conflicts=("$name")
source=("local://CrossCode_$pkgver.linux64.zip"
        "$name.png"
        "com.cross-code.CrossCode.desktop")
sha256sums=('782ea2a2e5882e387238b60a0ef4971041d4c4f752864c98cb1124089aeba077'
            'da79d285e53d909b4c4dbd4182a9ff9ea5b8677f37f0a3187b475a703219c5e2'
            '6ec25f16376182c0868754f195514f93e85d31d60ab7a229c1defb2521789238')

package() {
    mkdir -p $pkgdir/opt/$name
    chmod +x CrossCode
    rsync -r --no-links . $pkgdir/opt/$name
    install -Dm644 $name.png $pkgdir/usr/share/pixmaps/$name.png
    install -Dm644 com.cross-code.CrossCode.desktop $pkgdir/usr/share/applications/com.cross-code.CrossCode.desktop
}
