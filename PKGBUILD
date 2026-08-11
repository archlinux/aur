# Maintainer: Javier Tia <floss@jetm.me>
_pkgauthor=manuelschipper
_pkgname=nah
pkgname=nah-bin
pkgver=1.2.0
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
sha256sums_x86_64=('f650e5d40dc519ccc9216926bac96f9d2710200a13d863582a96a362d1d902b3')
sha256sums_aarch64=('15c1a439ff9675956d0d74addd06ef448a76982565817e670e181208e1b4823b')

package() {
  cd "${srcdir}" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
