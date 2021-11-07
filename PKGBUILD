# Maintainer: Vitaliy Volynskiy (i@vitalya.me)

pkgname=vk-messenger
pkgver=5.3.2
pkgrel=2
pkgdesc="VK Messenger for Linux"
arch=('x86_64')
url="https://vk.com/messenger"
license=('custom')
depends=('alsa-lib' 'expat' 'gtk3' 'libgcrypt' 'libgnome-keyring' 'libnotify' 'libxss' 'libxtst' 'nss' 'xdg-utils')
optdepends=('gnome-keyring')
source=("https://desktop.userapi.com/rpm/master/vk-${pkgver}.x86_64.rpm")
sha256sums=('b290f0f5c7c34a522e0b03aa444b2a5c2d7db71eb64e2033f5f8c84bd9588d24')

prepare() {
    rm -r "${srcdir}"/etc/{pki,yum.repos.d}
    rm "${srcdir}/vk-${pkgver}.x86_64.rpm"
}

package() {
    mv "${srcdir}"/* "${pkgdir}"
}
