# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tlsx"
pkgname="${_pkgname}-bin"
pkgver=1.2.2
pkgrel=1
pkgdesc="Fast and configurable TLS grabber focused on TLS based data collection"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/projectdiscovery/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${url##*/}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm.zip")
source_i686=("${_pkgsrc}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.zip")
sha256sums_aarch64=('8776c2f5df56dfca56013aea955585a868e6e6553b44c63e7f65c94527c54491')
sha256sums_armv7h=('99d5260f447e23a3f07e847f1acffa52a48f4b715018a4d4b03cb352834d5930')
sha256sums_i686=('37415b409e4474c8c74b79284b2ddbe9b9e096d1ebf3245a474b0aef15be0af8')
sha256sums_x86_64=('6c4a0dff8473e954d3aa9b6c0cc9c68047cc7e2fb607fa94359f4ec55ef3f98c')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
