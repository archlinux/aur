# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=loeffel-io
_pkgname=ls-lint
pkgname=${_pkgname}-bin
pkgver=2.3.2
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
            '582398429d2d318eb6ce983ec1da182791904c878c77c6254ead84cbe1ec2ae4')
sha256sums_x86_64=('35f2cfd41fd2aa25f388926554fde146395dee6e5030ead2de948181a1a27cef')
sha256sums_aarch64=('e03e0fb960be3bf8119dacd5999468cb07a499b61db47e048a4feba7c526df5c')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-linux-amd64" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
