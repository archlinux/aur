# Maintainer: Your Name <your.email@example.com>
pkgname=jentlememes-launcher-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='JentleMemes Minecraft launcher (prebuilt binary)'
arch=('x86_64')
url='https://github.com/rongus760-ship-it/JentleMemes-Launcher'
license=('Apache-2.0' 'MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'gdk-pixbuf2' 'openssl' 'hicolor-icon-theme')
provides=('jentlememes-launcher')
conflicts=('jentlememes-launcher')

source=("${pkgname%-bin}::${url}/releases/download/v${pkgver}/jentlememes-launcher")
source+=('jentlememes-launcher.desktop')

sha256sums=('259b680f433245e42028fe1670942f5d0da6a498dd150cb04b04d3e3b9e16f85'
            '800a92e394e3a935b105b6717762ca5d251cb6ab5c105694aac8e1d137ebd6b8')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"

  install -Dm644 "${srcdir}/jentlememes-launcher.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
