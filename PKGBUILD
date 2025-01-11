# Maintainer: Denis Kasak <dkasak AT termina.org.uk>
# Contributor: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: Genki Sky <alt+archlinux.org@genki.is>

pkgname=tla-toolbox
pkgver=1.7.4
pkgrel=1
pkgdesc='IDE for the TLA+ tools'
arch=('x86_64')
url='http://research.microsoft.com/en-us/um/people/lamport/tla/toolbox.html'
license=('MIT')
depends=('java-runtime')
source=("https://github.com/tlaplus/tlaplus/releases/download/v$pkgver/TLAToolbox-$pkgver-linux.gtk.x86_64.zip"
        tla-toolbox.desktop
        icon.png)
sha256sums=('7982b671726f2c841f90afa89eba26c2135f026cd64b20995c2b04391c648da5'
            '900b0d2e03a7254faa108653aee50f1107b249c41e40d66655f7fdb12d4a5c82'
            '51dbb6724fa7ff5167067dce68dd6b577a2401a47a37120a9879f0afd85ff7c9')

package() {
    install -d -m755 "$pkgdir/usr/share/java/tla-toolbox"
    cp -r "$srcdir"/toolbox/* "$pkgdir/usr/share/java/tla-toolbox/"
    install -d -m755 "$pkgdir/usr/bin"
    ln -s "/usr/share/java/tla-toolbox/toolbox" "$pkgdir/usr/bin/tla-toolbox"
    install -D -m644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/tla-toolbox.png"
    install -D -m644 "$srcdir/tla-toolbox.desktop" "$pkgdir/usr/share/applications/tla-toolbox.desktop"
}
