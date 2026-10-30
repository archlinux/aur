# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=shenwei356
_pkgname=brename
pkgname=${_pkgname}-bin
pkgver=2.15.0
pkgrel=1
pkgdesc='A practical cross-platform command-line tool for safely batch renaming files/directories via regular expression'

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

arch=('x86_64' 'i686' 'aarch64')
license=('MIT')

conflicts=("${pkgname%-bin}")
provides=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64.tar.gz")
sha256sums=('6614854202608ae15ef1af8120372408b08181e354645b7f44eab46f31ae0f1d'
            'a1688ef66ebfecad0adbf176c5f1d7e9c587483ab7201b88fd957a8c0d10dca3'
            'af40aa7d2e1f8f5137b7127a2e4c42d0510c0ed77f12e29ecec34702e680e66a')
sha256sums_x86_64=('450883da31edf58a12f6aa5dea56c054de852cd081322828914776062b616c4b')
sha256sums_i686=('9f537af1d1a591236664650a0fc9874d740483243ead83d6288c99a47fa69846')
sha256sums_aarch64=('204d14afa55d2fc301f935fe999e5874cf8ddfa8d02fb33e5ec2d9689793210b')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
