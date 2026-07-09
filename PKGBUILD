# Maintainer:
# Contributor: irmluity <45vw4yz8g@mozmail.com>
# Contributor: d6k283tix <d6k283tix@mozmail.com>

pkgname=bitcomet
pkgver=2.21.2
pkgrel=1
pkgdesc="A BitTorrent/HTTP/FTP download client"
arch=(x86_64)
url='https://www.bitcomet.com'
license=('LicenseRef-bitcomet')
depends=('cairo'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'gtk3'
         'hicolor-icon-theme'
         'libgcc'
         'libstdc++'
         'libx11'
         'libxkbcommon'
         'pango'
         'webkit2gtk')
source=("${pkgname}-${pkgver}.deb::https://download.bitcomet.com/linux/x86_64/BitComet-${pkgver}-x86_64.deb"
        "LICENSE.html::https://www.bitcomet.com/en/license")
sha256sums=('a873ebe06f76d56d4f97b9f45aff7cc8b45bb0090906b39cca0f641c78ed0467'
            '9cf498706b3aeeb79f9b99fd59b8fa84a4d88dd0442495209b28f6ac8e72333e')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}" --no-same-owner --no-same-permissions
    install -Dm644 LICENSE.html -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
