# Maintainer: ycna07 <aozakitouko at foxmail dot com>
pkgname=reinamanager-bin
_pkgname=ReinaManager
pkgver=0.32.0
pkgrel=3
pkgdesc="A lightweight galgame/visual-novel manager,Under development..."
arch=('x86_64' 'aarch64')
url="https://github.com/huoshen80/ReinaManager"
license=('AGPL-3.0-only')
depends=( 'openssl' 'libxcb' 'libsoup3' 'dbus' 'cairo'  'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme'   'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}-git" "${pkgname%-bin}")
source_x86_64=("${_pkgname}_${pkgver}_${CARCH}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}_${pkgver}_${CARCH}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
sha256sums_x86_64=('baf91b1c2d7f47a7c3f2a541cc12b75a6ab9b837e2d773e3e7e5a0689adf7131')
sha256sums_aarch64=('c4827dede54f6a37ff0bdbc2d8ed428305ceea459895a515497f8117018b57c4')

prepare(){
    ar -x "${_pkgname}_${pkgver}_${CARCH}.deb"
    mkdir -p ${_pkgname}
    tar -xf data.tar.gz --directory="${_pkgname}"
}

package() {
  cd "${_pkgname}"
  cp -r ./ ${pkgdir}/
}
