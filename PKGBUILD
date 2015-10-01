# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.0.288.3
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind. (weekly snapshot)'
url="https://vivaldi.com"
install=vivaldi.install
options=(!strip !zipman)
license=('custom')
arch=('i686' 'x86_64')
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'alsa-lib')
source_i686=("https://vivaldi.com/download/snapshot/vivaldi-snapshot-${pkgver}-1.i386.rpm")
source_x86_64=("https://vivaldi.com/download/snapshot/vivaldi-snapshot-${pkgver}-1.x86_64.rpm")
sha256sums_i686=('99364999b702eea07d097bb438c70fb94fc5cfc78db272952fd607bc1fd9bbcf')
sha256sums_x86_64=('bdb68e163828e404d6f18935de1aed03925e1a9db06ae51c80eb80f74cc3b03d')

package() {
    cp -a {opt,usr} "$pkgdir"

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/vivaldi-snapshot/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi-snapshot.png"
    done
}

