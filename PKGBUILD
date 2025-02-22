# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=VHSgunzo
_pkgname=sharun
pkgname=${_pkgname}-bin
pkgver=0.4.2
pkgrel=1
pkgdesc='Run dynamically linked ELF binaries everywhere'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}")
sha256sums=('ed1795c447be9b4ae96262f583b559f733a82f627b0265f860f22488c7f8b2ff'
            'bb0abfb13044db28a1096d2b0a488c7a0f2209c0d891f9954ac15e2913dad758')
sha256sums_x86_64=('dea96be7c2672a15ca3dfbbc834f7bb34b4bd13eebfc8a3e862955546c371074')
sha256sums_aarch64=('34dc11d30909dc0eabdaa259ed33da2e4d5c6329b1b2e5465c0796c3366dadf9')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
