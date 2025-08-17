# Maintainer: Sohrab Behdani <behdanisohrab@riseup.net>
pkgname=proxycloud-gui-bin
pkgver=1.4.0
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

sha256sums=('c538f7756ee6ea9030e766fd29ca2b689195bc1f5c292bd2ee5e5f0e0f36219c')

options=(!debug !strip)

package() {
    cd "${pkgdir}"

    bsdtar -xf "${srcdir}/data.tar.xz"
}
