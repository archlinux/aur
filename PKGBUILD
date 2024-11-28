# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=x-motemen
_pkgname=gore
pkgname=${_pkgname}-bin
pkgver=0.5.7
pkgrel=1
pkgdesc='Yet another Go REPL that works nicely'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('go')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('bdeb94958251e3737da4e67fc7bca1e1640fcaaa92529833c288ccba124adec1')
sha256sums_aarch64=('f8bd50ea224b9aabc7d96a06489f48fd51568b343e5af5ad42e85b5578a24e72')

package() {
  cd "${srcdir}/$(ls -d */ | head -n 1)/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CREDITS" "${pkgdir}/usr/share/doc/${pkgname}/CREDITS"
}
