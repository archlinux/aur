# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=VHSgunzo
_pkgname=sharun
pkgname=${_pkgname}-bin
pkgver=0.7.5
pkgrel=1
pkgdesc='Run dynamically linked ELF binaries everywhere'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=('!strip')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}")
sha256sums=('ed1795c447be9b4ae96262f583b559f733a82f627b0265f860f22488c7f8b2ff'
            'a328db5bed9f7b765b0a454d203c6861f03751aba0e2ff83d9e14488d19900c2')
sha256sums_x86_64=('8483ef1dda9551eb84834445d56c048b25fe9c050319a11f4073f34f5566ab10')
sha256sums_aarch64=('58286a756ca1a5547dab63a75dd9270d1063a05735eaac415dca37ad9069b07c')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
