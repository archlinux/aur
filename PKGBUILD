# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.0.219.34
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind. (weekly snapshot)'
url="https://vivaldi.com"
install=vivaldi.install
options=(!strip !zipman)
license=('custom')
arch=('i686' 'x86_64')
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'alsa-lib')
optdepends=('ffmpeg: playback of proprietary formats')
conflicts=('vivaldi')
source_i686=("https://vivaldi.com/download/snapshot/vivaldi-snapshot-${pkgver}-1.i386.rpm")
source_x86_64=("https://vivaldi.com/download/snapshot/vivaldi-snapshot-${pkgver}-1.x86_64.rpm")
sha256sums_i686=('489d028e2038e0002740ff357c0ed73dae4fdb7380af28d0351075b4aed4cd55')
sha256sums_x86_64=('582825b525ff1adae329b86072d1238bce4a26ccddf99c5e78653310be9c7fdd')

package() {
    cp -a {opt,usr} "$pkgdir"

    # suid sanbox
    chmod 4755 "$pkgdir/opt/vivaldi-snapshot/vivaldi-sandbox"

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/vivaldi-snapshot/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi-snapshot.png"
    done
}

