# Maintainer: Pranav Agarkar <sarthyambal@gmail.com>
# Contributor: Pranav Agarkar <pranavagarkar8@gmail.com>
pkgname=beamsync-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="A fast, local peer-to-peer file transfer application with a NeoBrutalist interface"
arch=('x86_64')
url="https://github.com/PranavAgarkar07/BeamSync"
license=('MIT')
# webkit2gtk-4.1 is in Arch's extra repo (prebuilt). The old
# webkit2gtk package (4.0) was removed from the official repos.
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'libnotify')
optdepends=('libpulse: audio feedback for transfers')
provides=('beamsync')
conflicts=('beamsync')
options=('!strip')

source=("https://github.com/PranavAgarkar07/BeamSync/releases/download/v${pkgver}/BeamSync"
        "https://raw.githubusercontent.com/PranavAgarkar07/BeamSync/v${pkgver}/desktop/build/appicon/icon.png"
        "https://raw.githubusercontent.com/PranavAgarkar07/BeamSync/v${pkgver}/LICENSE"
        beamsync.desktop
        beamsync.metainfo.xml)
sha256sums=('SKIP'
            'f14aa8c257a606e9e82c4c7e6b0bc69a2635274c70aedaf97bd297521487bfdb'
            'c0533a3e30f93c3f82d0b0dfc85aa37c0ef0a4900d4b4414de57ff165d87309a'
            '3f21bb1ae285ee1309d23b2f7e49b2a901a70cff47140fd4f1011f72096a60d9'
            '55424fd70e7a7367be13a0e7b5652a6553f5471e48679454e62bb4dd8135615d')

package() {
  install -Dm755 "${srcdir}/BeamSync" "${pkgdir}/usr/bin/beamsync"

  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/beamsync.png"

  install -Dm644 "${srcdir}/beamsync.desktop" "${pkgdir}/usr/share/applications/beamsync.desktop"

  install -Dm644 "${srcdir}/beamsync.metainfo.xml" "${pkgdir}/usr/share/metainfo/beamsync.metainfo.xml"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/beamsync/LICENSE"
}
