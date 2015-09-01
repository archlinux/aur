# Maintainer: whike <sebastian.tauch@aborium.com>
 
pkgname=flashplayer-standalone
pkgver=11.2.202.508
pkgrel=1
pkgdesc="Macromedia standalone flash player (nonfree)"
arch=(i686 x86_64)
url=http://www.adobe.com/support/flashplayer/downloads.html
license=(custom)
# License matrix: http://www.adobe.com/products/eulas/
depends=(desktop-file-utils lib32-curl lib32-gtk2 lib32-libxt lib32-nss)
makedepends_x86_64=()
[[ $CARCH == "i686" ]] && depends=(${depends[@]/lib32-/})
options=(!strip)
install=$pkgname.install
source=(http://fpdownload.macromedia.com/pub/flashplayer/updaters/11/flashplayer_11_sa.i386.tar.gz
    license.pdf::http://www.adobe.com/products/eulas/pdfs/PlatformClients_PC_WWEULA-MULTI-20110809_1357.pdf
    flashplayer.desktop)
sha512sums=('0024a8ffb65360aad4c80248a6640ab9d2fbbbb07a56e3264ae8b649edac53a10e7ee3684177cc41f0bc15f01f07a4c066ada160b8fbce34792fbc6cca9d5fa3'
    'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e'
    'e4139b265896ebd276b4c7931d5718db7ac8b25e5e86decb2161c94d2b6b410dc7160667cda3a330ece40e64e7809d7afc5ddcc94e09352e84359fa4c7fe3e2d')
 
package() {
    desktop-file-install flashplayer.desktop --dir "$pkgdir"/usr/share/applications/
    install -Dm644 license.pdf "$pkgdir"/usr/share/licenses/$pkgname/license.pdf
    install -Dm755 flashplayer "$pkgdir"/usr/bin/flashplayer
}

