# Maintainer: Amiel Kyamko <junkfactory@gmail.com>
_uuid=ddterm@amezin.github.com
_pkgname=ddterm
pkgname=gnome-shell-extension-$_pkgname
pkgver=43
pkgrel=1
pkgdesc="Another Drop Down Terminal Extension for GNOME Shell"
arch=('any')
url="https://github.com/ddterm/$pkgname"
license=('GPL3')
depends=('gnome-shell' 'gjs' 'gtk3' 'vte3')
install=$_pkgname.install
makedepends=('zip')
source=($pkgname-v$pkgver.zip::https://github.com/ddterm/gnome-shell-extension-ddterm/releases/download/v$pkgver/ddterm@amezin.github.com.shell-extension.zip)
sha256sums=('3430f0668f486387db2331b583eb3e0ef9b8ad080aa09ff6223595658c18ae89')

package() {
    local dest="${pkgdir}/usr/share/gnome-shell/extensions/$_uuid"
    install -d "${dest}"
    bsdtar --no-same-owner -xvf $pkgname-v$pkgver.zip -C "${dest}"
}
