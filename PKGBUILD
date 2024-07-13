# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clipse"
pkgname="${_pkgname}-bin"
pkgver=1.0.5
pkgrel=1
pkgdesc="A configurable TUI clipboard manager for Unix"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/savedra1/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('glibc')
optdepends=('xclip: for X11 clipboard support'
            'wl-clipboard: for Wayland clipboard support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d5f8a2dd99829794cd365840da7dd048f8227df687ce2a14ea63a3d0daab730d')
sha256sums_i686=('7883ae77f2c7a7a3d8735a8b574f0cf5d3cb3aa6538add53e49d71d3f36d4126')
sha256sums_aarch64=('1c22e7cef67ef5646e1290fc8cf88c98e7276ee78286d3328948a55fa77c3670')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
