# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dnschanger-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Dns Changer for Windows, Linux operating systems"
arch=('x86_64')
url="https://dnschanger.github.io/"
_githuburl="https://github.com/DnsChanger/dnsChanger-desktop"
license=('MIT')
depends=('libdrm' 'pango' 'nss' 'libxfixes' 'gtk3' 'glib2' 'at-spi2-core' 'libxrandr' 'libxkbcommon' 'libxdamage' 'libcups' \
    'libxcomposite' 'libxext' 'dbus' 'nspr' 'mesa' 'alsa-lib' 'expat' 'glibc' 'gcc-libs' 'cairo' 'libxcb' 'libx11' 'hicolor-icon-theme')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/DNS.Changer-linux-amd64-${pkgver}.deb"
   "LICENSE::https://raw.githubusercontent.com/DnsChanger/dnsChanger-desktop/main/LICENSE")
sha256sums=('31bf3de2b5df7d8d789e324d01249a0aed94804401dffaa6c6216af46a7528a5'
            'd8cd7d03b1c407ad97d6059dd8d6821ce42ab3bd8e9d39caab2fe4e730c8f737')
 
package() {
   bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
   install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}