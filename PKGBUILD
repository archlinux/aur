# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=x-motemen
_pkgname=gore
pkgname=${_pkgname}-bin
pkgver=0.6.2
pkgrel=1
pkgdesc='Yet another Go REPL that works nicely'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc' 'go')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4c8bd2d0939e7123009df1620371a53b26473ba65d3e870d4a9749ca1912f5bb')
sha256sums_aarch64=('c9b1b898a0315bf4e764fcc105f3f5b5ed3444c2a89e6b64100dd35c2ee7fa90')

package() {
  cd "${srcdir}/$(ls -d */ | head -n 1)/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CREDITS" "${pkgdir}/usr/share/doc/${pkgname}/CREDITS.md"
}
