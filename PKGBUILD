# Maintainer: Julius <pleasedonotcontactforanyreason@tuta.io>
pkgname=powhttp-bin
pkgver=0.141.0
pkgrel=1
pkgdesc='A desktop HTTP client and API testing tool'
arch=('x86_64')
options=('!debug')
url='https://powhttp.com'
license=('LicenseRef-Powhttp')
depends=('cairo' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'gtk3' 'libsoup3' 'webkit2gtk-4.1')
optdepends=('xdg-utils: register powhttp:// links (xdg-mime default powhttp.desktop x-scheme-handler/powhttp)')
provides=('powhttp')
conflicts=('powhttp')
install="${pkgname}.install"
source=("https://releases.powhttp.com/${pkgver}/linux/x86_64/powhttp_${pkgver}_amd64.deb"
        "LICENSE"
        "upstream-license")
sha256sums=('218201b47066f7fae75b1566a00e924611349469932d31f6b9f0e23664af9efb'
            'febc00dc5a0557ca8afbcdc6d3896731dc42f4cecabd87e6c98326212f8dbf36'
            '2d075bcf302c1ead55d926ab30ec66994a1115b9e163085961dda151b00d0f5e')
package() {
  cd "$srcdir"
  ar x "powhttp_${pkgver}_amd64.deb" data.tar.gz
  tar -xzf data.tar.gz -C "$pkgdir"
  install -Dm644 upstream-license "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
