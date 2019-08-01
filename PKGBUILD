# Maintainer: lynix <lynix47@gmail.com>

# Derived from 'dina-font-otb' by Ckat <ckat@teknik.io>

pkgname=terminus-font-otb
pkgver=4.47
pkgrel=2

pkgdesc='Monospace bitmap font (OTB version)'
url='http://terminus-font.sourceforge.net/'
arch=('any')
license=('GPL2' 'custom:OFL')

makedepends=('fontforge')
depends=('fontconfig' 'xorg-font-utils')

source=("https://downloads.sourceforge.net/project/terminus-font/terminus-font-$pkgver/terminus-font-$pkgver.tar.gz"
        "otbconvert.pe")
sha256sums=('0f1b205888e4e26a94878f746b8566a65c3e3742b33cf9a4e6517646d5651297'
            '431999be6be2630a9e8b4bcc5631b6bc727b795978b75cb4c874d9ce143e9703')

build() {
    cd "terminus-font-$pkgver"
    ../otbconvert.pe *.bdf
}

package() {
    cd "terminus-font-$pkgver"
    for i in *.otb; do
        install -Dm 644 $i "$pkgdir/usr/share/fonts/misc/$i"
    done
    install -Dm644 "OFL.TXT" "$pkgdir/usr/share/licenses/terminus-font-otb/LICENSE"
}

# vim:set ts=4 sw=4 et:
