# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="slackdump"
pkgname="${_pkgname}-bin"
pkgver=3.0.8
pkgrel=1
pkgdesc="Save your private and public Slack messages, threads, files, and users locally"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/rusq/${_pkgname}"
license=('GPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
b2sums_aarch64=('edc55669669c0b0d4e43efb32ae4261bdd6e6f0a7d41e65d126ec6830016e0c1f4eb552db453e5cd1759fc999ef3f30070f40c2f2ee85d79603ab4524e498e8d')
b2sums_i686=('7d7e513624e37f21674ddf968797062749e4c950b08c4c82f73d46c4aaf867263b81c8b7b5f3925aeccc2e968d3feb9a468431873dade75db6ff967d8c1aa327')
b2sums_x86_64=('0651cf5c1843cbda66a277a539d6e00f41e825dd5a5b9a4432566815320395759c9487d1a4ec7344af1aca461dc2aa1776f9ba8ea8db9efee1ccfbd9ee4f6cc3')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"       "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
