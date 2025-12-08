# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=muesli
_pkgname=gitomatic
pkgname=${_pkgname}-bin
pkgver=0.2
pkgrel=1
pkgdesc='A tool to monitor git repositories and automatically pull & push changes'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
sha256sums=('233e8cf9a812999ccee4d3edb270b0f11ab3539658e680bcb873604915ca5038'
            '350bde2a70227391dbe60a77adef7847ef8b68c73e2704bb0d22118986d4ddd4')
sha256sums_x86_64=('86c6235718918a5499245a6797fcc11352f518053e8e81ab1fc119b835f66517')
sha256sums_i686=('67dc248bbd4112f015b1695fec709d6511de833c0dbb510493347a84e226a8fb')
sha256sums_aarch64=('3bc45bd5afd03938ecc97ea40b103db7b7c72873350cd9759ce6fc4058e0176e')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
