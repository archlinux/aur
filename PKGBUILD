# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clipse"
pkgname="${_pkgname}-bin"
pkgver=1.0.6
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
sha256sums_x86_64=('a205fbc808ad025801cc659796e71f9edffa3d4e2d2fe880f143293f7eab8e34')
sha256sums_i686=('2fd8378d230f2d6493cd999ad7c4aaeaca5a65de4f8978e53e914c103d9d20be')
sha256sums_aarch64=('fddd1f7c21c4c54c29520673b0915cf3d8cb8481498738ff13a26af4699398bf')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
