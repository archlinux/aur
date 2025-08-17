# Maintainer: Sohrab Behdani <behdanisohrab@riseup.net>
pkgname=proxycloud-gui-bin
pkgver=1.3.0
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

sha256sums=('b26797b076c675d68c69a0c3229f54ece2b70d2714b9477df01160c0de51ddf2')

options=(!debug !strip)

package() {
    cd "${pkgdir}"

    bsdtar -xf "${srcdir}/data.tar.xz"
}
