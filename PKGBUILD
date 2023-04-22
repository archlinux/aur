# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="ten-hands-bin"
pkgver=2.10.3
pkgrel=3
pkgdesc="Simplest way to organize and run tasks"
arch=('x86_64')
url='https://tenhands.app'
_githuburl="https://github.com/saisandeepvaddi/ten-hands"
depends=('at-spi2-core' 'libxcomposite' 'hicolor-icon-theme' 'libxrandr' 'gtk3' 'mesa' 'cairo' 'glib2' \
  'glibc' 'libxcb' 'libx11' 'libxext' 'alsa-lib' 'libxfixes' 'nspr' 'libxkbcommon' 'gcc-libs' 'dbus' \
  'libdrm' 'libcups' 'pango' 'libxdamage' 'nss' 'expat' 'gdk-pixbuf2')
license=('MIT')
provides=()
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-app_${pkgver}_amd64.deb"
  "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('5a1a4d3970a46d1fde2ccb506653f637a8b0edac5a77a64d12a45e723b555daa'
            '6b30b7530e47b208e4da08c8813ca52c63aae00d74d0b2036548069f59588d02')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}