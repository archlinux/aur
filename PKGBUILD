# Maintainer: Javier Tia <floss@jetm.me>
_pkgauthor=manuelschipper
_pkgname=nah
pkgname=nah-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='Safety guard that blocks catastrophic coding-agent tool calls before they run'
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('MIT')
# Upstream ships static musl builds, so there is nothing to link against.
conflicts=('nah')
provides=('nah')
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('ebef520073fd1a53f611fce24d40a92e1c7400d12c53f86ef3c34e8216a6dcee')
sha256sums_aarch64=('7a3272eb6e6affc79529d694442f254ca32495b08934fa255a68eb1b960d6643')

package() {
  cd "${srcdir}" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
