# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: 7k5x <7k5xlp0onfire@gmail.com>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
pkgname=headset-bin
pkgver=4.2.1
pkgrel=1
pkgdesc="An Electron-based music player for the busy ones"
arch=(x86_64)
url="https://headsetapp.co/"
_githuburl="https://github.com/headsetapp/headset-electron"
license=('MIT')
depends=('libx11' 'expat' 'gdk-pixbuf2' 'libxshmfence' 'libxrandr' 'libxcb' 'hicolor-icon-theme' 'cairo' \
  'pango' 'gcc-libs' 'gtk3' 'nss' 'alsa-lib' 'mesa' 'libxext' 'dbus' 'libcups' 'glib2' 'at-spi2-core' \
  'glibc' 'libxdamage' 'libxfixes' 'nspr' 'libxcomposite' 'libdrm' 'libxkbcommon')
provides=()
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
  "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('f3582c22aef8b2081ab84ea0f2933acf4e4a4e6b1b7b8f4265af5a450103c0ca'
            '0fd4183b7556b9f1b93d974969bad60053ab01db10ed2b501d26ed6840766045')

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}/usr/share/"{doc,lintian}
}