# Maintainer: HitCoder <hitcoder9768@gmail.com>

pkgname=vlabeler-bin
pkgver=1.5.0
pkgrel=1
pkgdesc='Open source voice labeling application'
arch=('x86_64')
license=('Apache')
url='https://github.com/sdercolin/vlabeler'
depends=('java-runtime=17')
makedepends=('java-environment=17')
source=("https://github.com/sdercolin/vlabeler/releases/download/1.5.0/vlabeler-1.5.0-amd64.deb"
        "vLabeler.desktop")
sha256sums=('dbc9b7950ae61c9bcdcd3184bf7c325ea6182ae58452b81986a724397f74fa46'
           'cb3e245702507f620545e1d442792427cdbb8a51d2c6f185238e9d3114398b76')

package() {
    cd "$srcdir"

    tar -xf data.tar.zst -C "$pkgdir"

    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/vlabeler/bin/vLabeler" "$pkgdir/usr/bin/vLabeler"

    # icon
    mkdir -p "$pkgdir/usr/share/pixmaps"
    ln -sf "/opt/vlabeler/lib/vLabeler.png" "$pkgdir/usr/share/pixmaps/vlabeler.png"

    # desktop file
    install -Dm644 "$srcdir/vLabeler.desktop" "$pkgdir/usr/share/applications/vLabeler.desktop"
}
