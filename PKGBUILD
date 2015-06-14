# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

_pkgname=flashplayer-standalone
pkgname=bin32-${_pkgname}
depends=('lib32-gtk2' 'lib32-libxt' 'lib32-nss' 'lib32-curl' 'desktop-file-utils' 'hicolor-icon-theme')
pkgver=11.2.202.460
pkgrel=1
pkgdesc="Macromedia standalone flash player (nonfree)"
url="http://www.adobe.com/support/flashplayer/downloads.html"
license="custom"
arch=('x86_64')
provides=("flashplayer-standalone")
conflicts=("flashplayer-standalone")
source=("http://fpdownload.macromedia.com/pub/flashplayer/updaters/11/flashplayer_11_sa.i386.tar.gz"
        "http://www.adobe.com/products/eulas/pdfs/PlatformClients_PC_WWEULA-MULTI-20110809_1357.pdf"
        "flashplayer.desktop")
sha256sums=('efa74f4466e368956f072eaefd42999a343fe773850b29b64d1904a0534f6929'
            'd30b03c0f70f7c4a7837751286bab579d5033f2e7a1548279a9c09ea905b2849'
            '78e4589aa9a3aa1fbf3813dda8c74da45ca363721ad34e2dd53dc3f096c579d7')
options=('!strip')
install="${_pkgname}.install"

package() {
  install -Dm644 "$srcdir"/flashplayer.desktop \
    "$pkgdir"/usr/share/applications/flashplayer.desktop
  install -Dm644 "$srcdir"/PlatformClients_PC_WWEULA-MULTI-20110809_1357.pdf \
    "$pkgdir"/usr/share/licenses/$pkgname/PlatformClients_PC_WWEULA-MULTI-20110809_1357.pdf
  install -Dm755 "$srcdir"/flashplayer \
    "$pkgdir"/usr/bin/flashplayer
}
