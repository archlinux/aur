# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=loeffel-io
_pkgname=ls-lint
pkgname=${_pkgname}-bin
pkgver=2.2.3
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
sha256sums=('864e3ef166eb372f1e6b333539a8fad3a9df57463bb41aae14e0aba6d6f4bd33'
            'd62b15b4a1f83131043e60b25b8910d44e94cd608b6c11ee9df0abc8b38526f2')
sha256sums_x86_64=('877df1d0ffc9f5b15ad21191fb67fd77fcb4812a9469dfd8c83ec17e857da6e6')
sha256sums_aarch64=('f22f481d17b893758b338de0e5ccc191e029020caa7bc388d1d805d5f77115a8')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-linux-amd64" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
