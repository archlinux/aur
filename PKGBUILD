# Maintainer: ycna07 <aozakitouko at foxmail dot com>
pkgname=reinamanager-bin
_pkgname=ReinaManager
pkgver=0.34.0
pkgrel=1
pkgdesc="A lightweight galgame/visual-novel manager,Under development..."
arch=('x86_64' 'aarch64')
url="https://github.com/huoshen80/ReinaManager"
license=('AGPL-3.0-only')
depends=( 'openssl' 'libxcb' 'libsoup3' 'dbus' 'cairo'  'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme'   'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}-git" "${pkgname%-bin}")
source_x86_64=("${_pkgname}_${pkgver}_x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}_${pkgver}_arm64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
sha256sums_x86_64=('3deb3cf831fcdd9c2a306e5eea368ec2cf0ff113a509c465c13fd4d9ffef0b24')
sha256sums_aarch64=('640ec50884159d9c9124bbd47ac922e01a54514c1af0a024ebbb8c0bd75d2d95')


package() {
  bsdtar -xf data.tar.* -C "${pkgdir}/"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
}
