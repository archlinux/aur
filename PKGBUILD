# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clipse"
pkgname="${_pkgname}-bin"
pkgver=1.0.8
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
sha256sums_x86_64=('2938c300bcb4350b97c872a7350f6886b1214778fe27654efe5cc6d892fafe40')
sha256sums_i686=('254c7d34f6f29454a2561b274105a55d5c7855726963709dcb0a7301b511fa99')
sha256sums_aarch64=('1c70ed2d331fe9133957927f96d50354393df47252f6f29bc4c35407eb6a6dcc')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
