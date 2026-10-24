# Maintainer: ycna07 <aozakitouko at foxmail dot com>
pkgname=reinamanager-bin
_pkgname=ReinaManager
pkgver=0.32.1
pkgrel=2
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
sha256sums_x86_64=('e496da8438a5a65d5d9d91cb9adcdb5dc8c7a0028a8d0acab75e34d4bb7fa45d')
sha256sums_aarch64=('44b4f896d64ecb18c98dfc760aec13ad3219d70c5810a41f077f1ff0b0d56d7c')


package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}/"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
}
