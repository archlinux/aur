# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="aeon-bin"
pkgver=0.2.22
pkgrel=1
pkgdesc="Scan the internet for your personal information and modify or remove it"
arch=("x86_64")
url="https://aeon.technology/"
_githuburl="https://github.com/leinelissen/aeon"
license=('EUPL')
depends=('pango' 'gtk3' 'libxkbcommon' 'nspr' 'nss' 'at-spi2-core' 'libxdamage' 'libxext' 'openssl-1.1' 'glibc' 'libcups' 'libxfixes' \
    'alsa-lib' 'dbus' 'libx11' 'gcc-libs' 'glib2' 'libxcomposite' 'libsecret' 'mesa' 'libxcb' 'libdrm' 'krb5' 'expat' 'cairo' 'libxrandr')
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/leinelissen/aeon/master/LICENSE")
sha256sums=('3a3c1112a6a750d503f08ccb2a7481dead7e4e58fc057d99f04f364dcf3c916a'
            '6e5399ad2f4548dc22dd9eff1c367d5d286efc15723894b3a3b772347b609d11')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    chmod 0755 "${pkgdir}/usr/lib/${pkganme%-bin}/chrome-sandbox"
}