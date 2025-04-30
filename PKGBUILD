# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aix"
pkgname="${_pkgname}-bin"
pkgver=0.0.5
pkgrel=1
pkgdesc="CLI tool to interact with Large Language Models (LLM) APIs"
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
sha256sums_aarch64=('5cccb85941be3117454ca9ab8a80a22f7167cd2ab07f3600a2bbca2daad9ad2d')
sha256sums_armv7h=('d7d47a764ed14c12256b15469a396da51df9336052dcced30345b7f74241dff3')
sha256sums_i686=('2dfc14340438e71058dc9d297fb8dd260b4f401d682a8d34e4223a7ec5104997')
sha256sums_x86_64=('7b16825fcd183e5a7b99dcb8fc353d8a0baa96aaa806df1061da0a1935d4dee3')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
