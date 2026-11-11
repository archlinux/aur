# Maintainer: ycna07 <aozakitouko at foxmail dot com>
pkgname=reinamanager-bin
_pkgname=ReinaManager
pkgver=0.33.0
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
sha256sums_x86_64=('dc288f5136082b37d4286c724efe7e42f804e446b743be7da2ca4afa9c11cb4e')
sha256sums_aarch64=('bb6a88364a906f490c9d842ea8166888ba2349685d2683aeb054ed6376430e11')


package() {
  bsdtar -xf data.tar.* -C "${pkgdir}/"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
}
