# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=loeffel-io
_pkgname=ls-lint
pkgname=${_pkgname}-bin
pkgver=2.3.1
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
            'a8c1de40591cadc33fdc3584e19b15e44ced82cf94e5cf7b3d58dfce884e34d7')
sha256sums_x86_64=('3275a459183f50fa299d27512774af1ac9817f23e2409c89fa25558a310530b9')
sha256sums_aarch64=('a835b97d7a369fa428572ce9cac98a5453b5af351e3647e0b80b4769d1001367')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-linux-amd64" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
