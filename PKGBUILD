# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dnschanger-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="Dns Changer for Windows, Linux operating systems"
arch=('x86_64')
url="https://dnschanger.github.io/"
_githuburl="https://github.com/DnsChanger/dnsChanger-desktop"
license=('MIT')
depends=('libdrm' 'pango' 'nss' 'libxfixes' 'gtk3' 'glib2' 'at-spi2-core' 'libxrandr' 'libxkbcommon' 'libxdamage' 'libcups' \
    'libxcomposite' 'libxext' 'dbus' 'nspr' 'mesa' 'alsa-lib' 'expat' 'glibc' 'gcc-libs' 'cairo' 'libxcb' 'libx11' 'hicolor-icon-theme')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/DNS.Changer.OpenSource.-linux-amd64-${pkgver}.deb"
   "LICENSE::https://raw.githubusercontent.com/DnsChanger/dnsChanger-desktop/main/LICENSE")
sha256sums=('0c25a3edd92df7e7435ad443a8e567e5946386c88852bf6dc73e24b437aea217'
            'd8cd7d03b1c407ad97d6059dd8d6821ce42ab3bd8e9d39caab2fe4e730c8f737')
 
package() {
   bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
   install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}