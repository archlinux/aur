# Maintainer:
# Contributor: irmluity <45vw4yz8g@mozmail.com>
# Contributor: d6k283tix <d6k283tix@mozmail.com>

pkgname=bitcomet
pkgver=2.10.0
pkgrel=1
pkgdesc="A BitTorrent/HTTP/FTP download client"
arch=(x86_64)
url='https://www.bitcomet.com'
license=('LicenseRef-bitcomet')
depends=('cairo'
         'expat'
         'gcc-libs'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'gtk3'
         'hicolor-icon-theme'
         'libpng'
         'libx11'
         'libxml2'
         'pango'
         'webkit2gtk'
         'zlib')
source=("${pkgname}-${pkgver}.deb::https://download.bitcomet.com/linux/x86_64/BitComet-${pkgver}-x86_64.deb"
        "LICENSE.html::https://www.bitcomet.com/en/license")
sha256sums=('356156123a62036a5e70aa59ffee2599b65d04f5e038fa0e04cf10ad30970c1f'
            'bfb81836442482cad69b02862f211f1f86fcfa51117ba5ab19a48b94e23fdd9f')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}" --no-same-owner --no-same-permissions
    install -Dm644 LICENSE.html -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
