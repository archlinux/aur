# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=loeffel-io
_pkgname=ls-lint
pkgname=${_pkgname}-bin
pkgver=2.3.0
pkgrel=1
pkgdesc='An extremely fast directory and filename linter'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz")
sha256sums=('d78562c5bf32368fd877e0de68c2914b6b6f41b38b60c65cbf0f193c114ae31d'
            'e458869c1b07baaf5b78faf172ad8d7d1706fc17cbcf28e007f1f6615e7d68f2')
sha256sums_x86_64=('eb1477360768bf0d717954a36dac155bbed6fce3c7bc6d87c4a8153b8c9da76a')
sha256sums_aarch64=('d1247dfff2a38362ac8ae54c8e90b68175a1dc4e7bf7d6f49a59770062250937')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-linux-amd64" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
