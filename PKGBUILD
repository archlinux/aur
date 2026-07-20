# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="oshot-bin"
_pkgname="oshot"
pkgver=0.4.6
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
	"${url}/releases/download/v${pkgver}/${_pkgname}-linux-v${pkgver}.zip"
	"${url}/raw/refs/tags/v0.4.6/LICENSE"
	"${url}/raw/refs/tags/v0.4.6/oshot.desktop"
)
sha256sums=(
	"4aa5cff9151715984d4954be8663b9c550dfa9cc89f0fe57b98833842d7f7ebf"
	"4a509aaabf33b5edb9cc7eea738c3d732b99a78f48c6ae81bd8eeb487edbb8e6"
	"8857babab6f47f246abe66b025b84ce9224d777f7fa6e72b48a0b2eec4da275b"
)

package() {
    mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/applications/"
    mv "${srcdir}/${_pkgname}/oshot" "${pkgdir}/usr/bin/"
    mv "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    mv "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
