# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.0.178.2
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
sha256sums_i686=('0b3e8a8734b4112221a65534f415bf9c9902e7b284de9a02939bbcc1be91275d')
sha256sums_x86_64=('fab729764b0f1b8aa697e80c416ff21e5abb6620bb9c74e2f4ebd95eec6b4ec7')

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

