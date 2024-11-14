# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=ariasmn
_pkgname=ugm
pkgname=${_pkgname}-bin
pkgver=1.6.0
pkgrel=1
pkgdesc='A terminal based UNIX user and group browser'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64")
source_i686=("${_pkgname}-${pkgver}-${arch[1]}::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386")
source_aarch64=("${_pkgname}-${pkgver}-${arch[2]}::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64")
sha256sums=('f948894f617a6490d2ad9c84673cc1b1fb746ba0d08b263046c9ca78a9d60b8d'
            '8deecbb70d79901cd0ad6f66ac76c645f23a12d4188f3fc7f0386bbeadbf1c73')
sha256sums_x86_64=('13fa663ed5fd1e7ba1d3de8866809fc06e20dad8432032264ef82c3a1a91d2fc')
sha256sums_i686=('f68c38cb407d3f874b2a516f340b2f23efbbf06ea12f288eb2e76516fbf2cb03')
sha256sums_aarch64=('e779922cea6cc14ecb5d21d4e41005c844178f0ca74abfd97fb742d06641e436')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
