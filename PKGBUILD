# Maintainer: Sohrab Behdani <behdanisohrab@riseup.net>
pkgname=proxycloud-gui-bin
pkgver=1.6.0
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

sha256sums=('50ca1b5748a0853e07e43f5f2389076aefa18828b5f2e7392f979feeb688819a')

options=(!debug !strip)

package() {
    cd "${pkgdir}"

    bsdtar -xf "${srcdir}/data.tar.xz"
}
