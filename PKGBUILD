# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=migasfree-play-bin
pkgver=5.5.0
pkgrel=2
pkgdesc="Migasfree Client front-end. Allow install/uninstall available applications and printers."
arch=('x86_64')
url="https://github.com/migasfree/migasfree-play"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('expat' 'hicolor-icon-theme' 'bash' 'glib2' 'libxrandr' 'at-spi2-core' 'libxkbcommon' 'cairo' 'libxdamage' 'glibc' 'libcups' \
    'nspr' 'nodejs' 'alsa-lib' 'nss' 'libdrm' 'dbus' 'libx11' 'gcc-libs' 'mesa' 'libxext' 'libxcb' 'gtk3' 'libxcomposite' 'libxfixes' 'pango')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('aa88984c061201df8247902d49c98be956dfbf959bbfe25a00aa8e924b15e9dc')
package() {
    bsdtar -xvf "${srcdir}/data.tar.zst" -C "${pkgdir}" --gname root --uname root
    chmod 755 "${pkgdir}/etc/sudoers.d/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/usr/share/${pkgname%-bin}/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}