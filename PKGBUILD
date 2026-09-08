# Maintainer: ycna07 <aozakitouko at foxmail dot com>
pkgname=reinamanager-bin
_pkgname=ReinaManager
pkgver=0.29.2
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
sha256sums_x86_64=('739cb150563822d5d13b5a4fed9e4ec91806f5814b4fdb3a6509110a57dd3c6e')
sha256sums_aarch64=('814fac2451bac2f06f8df5a4f074d5b4e6988c15ff952dba784f7dd9d110e22f')

prepare(){
    ar -x ${_pkgname}_${pkgver}_amd64.deb
    mkdir -p ${_pkgname}
    tar -xf data.tar.gz --directory="${_pkgname}"
}

package() {
  cd "${_pkgname}"
  cp -r ./ ${pkgdir}/
}
