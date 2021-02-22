# Maintainer: Vitaliy Volynskiy (i@vitalya.me)

pkgname=vk-messenger
pkgver=5.2.3
pkgrel=2
pkgdesc="VK Messenger for Linux"
arch=('x86_64')
url="https://vk.com/messenger"
license=('custom')
depends=('alsa-lib' 'expat' 'gtk2' 'libgcrypt' 'libgnome-keyring' 'libnotify' 'libxss' 'libxtst' 'nss' 'xdg-utils')
optdepends=('gnome-keyring')
source=("https://desktop.userapi.com/rpm/master/vk-${pkgver}.x86_64.rpm")
sha256sums=('2b47c8829fd04b172af316f5a5143c52cba7397057a2a20be365867dad52dad4')

prepare() {
    rm -r "${srcdir}"/etc/{pki,yum.repos.d}
    rm "${srcdir}/vk-${pkgver}.x86_64.rpm"
}

package() {
    mv "${srcdir}"/* "${pkgdir}"
}
