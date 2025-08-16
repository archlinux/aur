# Maintainer: Nero Blackstone <gf7600gs@gmail.com>

pkgname=owlplug-bin
pkgver=1.29.2
pkgrel=1
pkgdesc="Audio plugin manager. Small tool to manage VST / AU / LV2 plugins on Windows, MacOS and Linux."
arch=('x86_64')
url="https://owlplug.com/"
license=('GPL-3.0')
source=("https://github.com/DropSnorz/OwlPlug/releases/download/${pkgver}/OwlPlug-${pkgver}.deb")
sha256sums=('4c149b9672cd73004911b5443fa6bb23e9e46ca4a1a86b029b0273d401a8746b')

package() {
    cd "$srcdir"
    ar x OwlPlug-${pkgver}.deb
    tar -xf data.tar.* -C "$pkgdir"

    install -dm755 "$pkgdir/usr/share/applications"
    install -m644 "$pkgdir/opt/owlplug/lib/owlplug-OwlPlug.desktop" \
        "$pkgdir/usr/share/applications/owlplug.desktop"
}    