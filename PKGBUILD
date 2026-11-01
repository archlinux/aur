# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ariasmn
_pkgname=ugm
pkgname=${_pkgname}-bin
pkgver=1.10.0
pkgrel=1
pkgdesc='A terminal based UNIX user and group browser'

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

arch=('x86_64' 'i686' 'aarch64')
license=('MIT')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64")
source_i686=("${_pkgname}-${pkgver}-${arch[1]}::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386")
source_aarch64=("${_pkgname}-${pkgver}-${arch[2]}::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64")
sha256sums=('f948894f617a6490d2ad9c84673cc1b1fb746ba0d08b263046c9ca78a9d60b8d'
            '8deecbb70d79901cd0ad6f66ac76c645f23a12d4188f3fc7f0386bbeadbf1c73')
sha256sums_x86_64=('df2b63dbf095ebac5ffe6dc5706aa677102d062f9a1e4c5023ca6a365cca6487')
sha256sums_i686=('92d1c6f21ccf8d943db90bb00a47f6d556ee2dc4871a43abf01a63ea274a7a1d')
sha256sums_aarch64=('78a65bf0b36034dad58b5a19416a1f41d031499694e62bb1e191e94b830ae879')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
