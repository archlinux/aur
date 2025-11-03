# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=VHSgunzo
_pkgname=ssrv
pkgname=${_pkgname}-bin
pkgver=0.3.4
pkgrel=1
_pkgstr=g85a1f7f
pkgdesc='Shell server/client'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i386' 'aarch64')
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=('!strip')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-v${pkgver}.r0.${_pkgstr}-tls.tar.zst")
source_i386=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}-v${pkgver}.r0.${_pkgstr}-tls.tar.zst")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[2]}-v${pkgver}.r0.${_pkgstr}-tls.tar.zst")
sha256sums=('ed1795c447be9b4ae96262f583b559f733a82f627b0265f860f22488c7f8b2ff'
            '74161ac6404007c250caf8ec1556ddb6bbee99b0ac3e18d8616419ca7d7c1d6a')
sha256sums_x86_64=('9efb0cda49d6780ba646dfcff989377ab864d91e7b1ea05eb78f788b42244051')
sha256sums_i386=('225e0acd9c56974b95d9bd7dec6d22ee7e9a4bb6cd958fdd2cf6c6057e31d0b9')
sha256sums_aarch64=('e9fed8b56816c09cc3d3bc80e3d1d4017e3066f265c89338be90d7290fc91002')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
