# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="migasfree-play-bin"
pkgver=5.4.0
pkgrel=1
pkgdesc="Migasfree Client front-end. Allow install/uninstall available applications and printers."
arch=('x86_64')
url="https://github.com/migasfree/migasfree-play"
license=('custom')
options=(!strip)
providers=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(libxdamage dbus nspr expat libcups 'hicolor-icon-theme' cairo 'gcc-libs' libxrandr glibc pango libxkbcommon glib2 libx11 'alsa-lib' libxcb sh libxext libxcomposite mesa nodejs libxfixes gtk3 libdrm 'at-spi2-core' nss )
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('99c0e8fa7fe55cafacf253f716d7bb6326248a39b426fd8dd2cb82091e43dfe6')
package() {
    bsdtar -xvf data.tar.zst -C "${pkgdir}"
    chmod 755 "${pkgdir}/etc/sudoers.d/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/usr/share/${pkgname%-bin}/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}