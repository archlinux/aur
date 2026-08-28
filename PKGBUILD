# Maintainer: ycna07 <aozakitouko at foxmail dot com>
pkgname=reinamanager-bin
_pkgname=ReinaManager
pkgver=0.29.1
pkgrel=2
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
sha256sums_x86_64=('b790d738e53ab579fb6fc7d89d2b840e0fbd2e17eb654beb58f7fb95ee33e6f8')
sha256sums_aarch64=('675693d878b4872ac8cad1b589fcda587cfe648382e7d185c4875758dec6a0ef')

prepare(){
    ar -x ${_pkgname}_${pkgver}_amd64.deb
    mkdir -p ${_pkgname}
    tar -xf data.tar.gz --directory="${_pkgname}"
}

package() {
  cd "${_pkgname}"
  cp -r ./ ${pkgdir}/
}
