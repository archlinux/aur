# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=purpleclay
_pkgname=gpg-import
pkgname=${_pkgname}-bin
pkgver=0.9.1
pkgrel=1
pkgdesc='Easily import a GPG key within any CI workflow'

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')

depends=('glibc' 'gcc-libs')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('5babf02a83e426450bd589ce25d16ca8387f7bd31077e444a4c6b00748332361'
            '9a3ecfedc605550cf442e7a6b87f8c99ebe4879d0494586e8260cada8f064b96')
sha256sums_x86_64=('edb96bc78949dc6d74f276c4b400b3252f0e7687d5a9448f5eb5a3e15c1b114a')
sha256sums_aarch64=('6c966fa572ab9e190794ea74c86f012690cda5b9332898f73910507ecc7c62cc')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
