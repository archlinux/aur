# Maintainer: Sebastian Vandekerckhove <seb01 at foxatwork dot be>
pkgname=wayk-now
pkgver=3.3.2.0
pkgrel=1
pkgdesc='Instant Remote Support and Remote Desktop'
arch=('x86_64')
url='https://wayk.devolutions.net'
license=('non-free')
#options=()
#provides=()
#conflicts=()
install=${pkgname}.install
depends=('gtk3' 'libappindicator3' 'libxext' 'libxcursor' 'libxrandr' 'libxfixes' 'libxtst' 'libxinerama' 'glibc' 'cairo' 'glib2' 'pango' 'libx11' 'libxdamage')
optdepends=('libnotify')
source=("https://cdn.devolutions.net/download/Linux/Wayk/${pkgver}/wayk-now_${pkgver}_amd64.deb")
sha256sums=('2f8114ff98d290805a2ca0ade23ec3a2dcb41516732af52377a6afaceb690270')

prepare() {
    tar -xf data.tar.xz -C ${srcdir}
}

package() {
    install -D -m644 "${srcdir}/usr/share/applications/wayk-now.desktop" "${pkgdir}/usr/share/applications/wayk-now.desktop"
    install -D -m755 "${srcdir}/usr/bin/wayk-now" "${pkgdir}/usr/bin/wayk-now"
    install -D -m644 "${srcdir}/usr/share/wayk-now/WaykNow.png" "${pkgdir}/usr/share/wayk-now/WaykNow.png"
    install -D -m644 "${srcdir}/usr/share/polkit-1/actions/net.devolutions.wayk.policy" "${pkgdir}/usr/share/polkit-1/actions/net.devolutions.wayk.policy"
}
