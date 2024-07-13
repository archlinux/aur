# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clipse"
pkgname="${_pkgname}-bin"
pkgver=1.0.7
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
sha256sums_x86_64=('a4b5ea9e1d586fa4c4567abbe643de666e74312a76700258b53d2b53499197df')
sha256sums_i686=('b28d88418b9d7ccff696ada1cf03914c7a9587276c604b5fa4af5b03a9bc4605')
sha256sums_aarch64=('811b0fe77837d00d514aecd16866609dc0fe9a018f27016ecbefe9dbd601e0f6')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
