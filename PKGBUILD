# Maintainer: Amiel Kyamko <junkfactory@gmail.com>
_uuid=ddterm@amezin.github.com
_pkgname=ddterm
pkgname=gnome-shell-extension-$_pkgname
pkgver=36
pkgrel=1
pkgdesc="Another Drop Down Terminal Extension for GNOME Shell"
arch=('any')
url="https://github.com/ddterm/$pkgname"
license=('GPL3')
depends=('gnome-shell')
install=$_pkgname.install
makedepends=('zip')
source=($pkgname-v$pkgver.zip::https://github.com/ddterm/gnome-shell-extension-ddterm/releases/download/v$pkgver/ddterm@amezin.github.com.shell-extension.zip)
sha256sums=('0d85ee24efe2336fc4730558b954a3e89ec70e0ad23035fc1652810e53c2110e')

package() {
    local dest="${pkgdir}/usr/share/gnome-shell/extensions/$_uuid"
    install -d "${dest}"
    bsdtar --no-same-owner -xvf $pkgname-v$pkgver.zip -C "${dest}"
}
