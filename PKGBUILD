# Maintainer: Sohrab Behdani <behdanisohrab@riseup.net>
pkgname=proxycloud-gui-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="ProxyCloud GUI is a free, fast, and user-friendly desktop application for managing proxy connections across multiple platforms."
arch=('x86_64')
url="https://github.com/code3-dev/ProxyCloud-GUI"
license=("MIT")
depends=('at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils' 'polkit')
optdepends=('libappindicator-gtk3: systray and indicator support')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")

source=("${pkgname%-bin}-${pkgver}-amd64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64.deb")

sha256sums=('e9affe08cbb7efd4016c6c1ee5dc92ae45d96de24391d99d1a1c253a4a57967a')

options=(!debug !strip)

package() {
    cd "${pkgdir}"

    bsdtar -xf "${srcdir}/data.tar.xz"
}
