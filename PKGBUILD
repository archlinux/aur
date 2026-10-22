# Maintainer:
# Contributor: irmluity <45vw4yz8g@mozmail.com>
# Contributor: d6k283tix <d6k283tix@mozmail.com>

pkgname=bitcomet
pkgver=2.23.1
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
sha256sums=('74f5380902a8a5d24a50190af19c7d740743dd9b4955dad9737763db1da90847'
            '6597911187ac4ae5dcae7fe400be926a00b87a38398dbbd44f773c6ec4b358a8')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}" --no-same-owner --no-same-permissions
    install -Dm644 LICENSE.html -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
