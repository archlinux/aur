# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jmelahman
_pkgname=pkglint
pkgname=${_pkgname}-bin
pkgver=1.7.2
pkgrel=1
pkgdesc='Linter for Arch Linux PKGBUILDs'

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('89dfb018a8c6221ad5dd05928599ab1a074a72f37ef0d6a0a134b1937b76d5da')
sha256sums_aarch64=('f74c6885998812e087ea15e838b337f12ce9df429555007a29af985c367ca8bf')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
