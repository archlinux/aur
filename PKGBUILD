# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=x-motemen
_pkgname=gore
pkgname=${_pkgname}-bin
pkgver=0.6.0
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
sha256sums_x86_64=('0896caf34b396719df2f545b838851f8b3dab13853e0afaa162fd5960ff07783')
sha256sums_aarch64=('146a9e99e26e8e2e28e7a3b07c5ff3a7120f385722bb4b9530afc82d1128c8c0')

package() {
  cd "${srcdir}/$(ls -d */ | head -n 1)/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CREDITS" "${pkgdir}/usr/share/doc/${pkgname}/CREDITS"
}
