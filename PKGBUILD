# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: MidAutumnMoon <mid.autumn0moon@gmail.com>


_pkgauthor=ameshkov
_pkgname=dnslookup
pkgname=${_pkgname}-bin
pkgver=1.11.1
pkgrel=1
pkgdesc='Simple command line utility to make DNS lookups to the specified server'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-v${pkgver}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-386-v${pkgver}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64-v${pkgver}.tar.gz")
sha256sums_x86_64=('daf7b40d498d8ac8a94672b5f95e94d3efac53641a51fa72a5ad776e2cd532f1')
sha256sums_i686=('ccd60af022c3cbe72b731a12e58764ede5dcf8a53bc33c87c2477576b1a6141b')
sha256sums_aarch64=('9127073368d2dc4a58efc350cc2f43f680b1417ad35f2f1a3632fabb1ce61263')


package() {
  cd "${srcdir}/linux-"* || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
