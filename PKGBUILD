# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="pomota-bin"
pkgver=0.0.7
pkgrel=1
pkgdesc="A simple user-friendly cross-platform tauri based pomodoro timer app that forces you to take a break"
arch=('x86_64')
url="https://github.com/p32929/pomota"
license=("MIT")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('glibc' 'hicolor-icon-theme' 'cairo' 'pango' 'webkit2gtk' 'dbus' 'gtk3' 'gcc-libs' 'openssl-1.1' 'gdk-pixbuf2' 'glib2')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/app-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/p32929/pomota/master/LICENSE")
sha256sums=('352161b3791c2f95026457f02326b40ae24a771e93ca6b6e62a83813ceecf8b3'
            'e3c1038536eb14a593ec4d00bceccbaa4f531674adc2dd53c4be34851b0eb8b7')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}" --uname root --gname root
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}