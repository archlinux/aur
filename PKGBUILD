# Maintainer: Sohrab Behdani <behdanisohrab@riseup.net>
pkgname=proxycloud-gui-bin
pkgver=1.7.0
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

sha256sums=('4494998f4bdebe1ffb007410d3bce00fd2d7775a591ee8cb9827cff531389dd4')

options=(!debug !strip)

package() {
    cd "${pkgdir}"

    bsdtar -xf "${srcdir}/data.tar.xz"
}
