# Maintainer: Toni500 <tonino512@linuxmail.org>
_pkgver=0.5.0-rc1
pkgname="oshot-bin"
_pkgname="oshot"
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="A fast and lightweight screenshot tool for extracting text on the fly (binary files)"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/oshot"
license=('BSD-3-Clause')
depends=(
  'libx11'
  'libxcb'
  'libpng'
  'glfw'
  'tesseract'
  'tesseract-data-eng'
  'zbar'
  'libappindicator-gtk3'
)
optdepends=(
	'grim: wlroots-based compositor screen capture'
	'wl-clipboard: Wayland clipboard'
)
conflicts=('oshot' 'oshot-git')
source=(
	"${url}/releases/download/v${_pkgver}/${_pkgname}-linux-v${_pkgver}.zip"
	"${url}/raw/refs/tags/v${_pkgver}/LICENSE"
	"${url}/raw/refs/tags/v${_pkgver}/oshot.desktop"
)
sha256sums=(
	"32bf8f27f34f4d3abc17b53a29c94103158787441d7c1c577c9e8997013e3c89"
	"4a509aaabf33b5edb9cc7eea738c3d732b99a78f48c6ae81bd8eeb487edbb8e6"
	"8857babab6f47f246abe66b025b84ce9224d777f7fa6e72b48a0b2eec4da275b"
)

package() {
    cd "${srcdir}/${_pkgname}/"
    mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/applications/"
    mv "./bin/oshot" "${pkgdir}/usr/bin/"
    mv "./share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    mv "./share/licenses/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
