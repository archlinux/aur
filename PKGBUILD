# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.0.174.8
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
source_i686=("vivaldi-snapshot-${pkgver}-1.i386.rpm::https://vivaldi.com/download/download.php?f=vivaldi-snapshot-${pkgver}-1.i386.rpm")
source_x86_64=("vivaldi-snapshot-${pkgver}-1.x86_64.rpm::https://vivaldi.com/download/download.php?f=vivaldi-snapshot-${pkgver}-1.x86_64.rpm")
sha256sums_i686=('7634202356d40f0f1ad2b31d6594a13c21670ea5f453ae07598cb963b1c1c09c')
sha256sums_x86_64=('a87e69d05f5d0710b2d30f890acffd4e351700b88179ec4adae2fe670b5e30cb')

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

