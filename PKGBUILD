# Maintainer:
# Contributor: irmluity <45vw4yz8g@mozmail.com>
# Contributor: d6k283tix <d6k283tix@mozmail.com>

pkgname=bitcomet
pkgver=2.14.0
pkgrel=1
pkgdesc="A BitTorrent/HTTP/FTP download client"
arch=(x86_64)
url='https://www.bitcomet.com'
license=('LicenseRef-bitcomet')
depends=('cairo'
         'gcc-libs'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'gtk3'
         'hicolor-icon-theme'
         'libx11'
         'libxkbcommon'
         'pango'
         'webkit2gtk'
         'zlib')
source=("${pkgname}-${pkgver}.deb::https://download.bitcomet.com/linux/x86_64/BitComet-${pkgver}-x86_64.deb"
        "LICENSE.html::https://www.bitcomet.com/en/license")
sha256sums=('c4dde4d747bcd2ebac8eb3ab0c581752a74a87c4d7550ff69288d35ab700781e'
            'a5ceafe53c05956057d4abb7f29992cd61789c71d223ea9389569df1651b2289')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}" --no-same-owner --no-same-permissions
    install -Dm644 LICENSE.html -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
