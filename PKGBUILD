# Maintainer: Javier Tia <floss@jetm.me>
_pkgauthor=manuelschipper
_pkgname=nah
pkgname=nah-bin
pkgver=1.5.0
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
sha256sums_x86_64=('a565360358d1f219c69b5753ebe68b4df25ebbb7777e09c5157ec72286dfd9f9')
sha256sums_aarch64=('2a9a889e1bb2ad2be335843cff46d74d82725b7d37b377d78c3361b58636e609')

package() {
  cd "${srcdir}" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
