# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.0.190.2
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
sha256sums_i686=('427d8333f45361f5181fb78d93681d664aeade6a5ff05c77643d44c0f61c1308')
sha256sums_x86_64=('e414057008935be7f26b0fdfa657a866e8b3cac2d88fd5673c52d00e8ab6c705')

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

