# Maintainer: ycna07 <aozakitouko at foxmail dot com>
pkgname=reinamanager-bin
_pkgname=ReinaManager
pkgver=0.31.1
pkgrel=1
pkgdesc="A lightweight galgame/visual-novel manager,Under development..."
arch=('x86_64' 'aarch64')
url="https://github.com/huoshen80/ReinaManager"
license=('AGPL-3.0-only')
depends=( 'openssl' 'libxcb' 'libsoup3' 'dbus' 'cairo'  'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme'   'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}-git" "${pkgname%-bin}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
sha256sums_x86_64=('6f75a6d68ffddac33c856a974d2677a9d75d516fb4d66463bd19ae5c0673aaf5')
sha256sums_aarch64=('5ae634b624ac45ba3c1051f3b193db982cdbedf82dfcec32a476ddd5ed5cfdd4')

prepare(){
    ar -x ${_pkgname}_${pkgver}_amd64.deb
    mkdir -p ${_pkgname}
    tar -xf data.tar.gz --directory="${_pkgname}"
}

package() {
  cd "${_pkgname}"
  cp -r ./ ${pkgdir}/
}
