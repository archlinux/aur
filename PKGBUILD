# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Gabriel M. Dutra <me@sizeofnull.xyz>

_pkgauthor=control-theory
_pkgname=gonzo
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="TUI log analysis tool"

pkgver=0.3.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('22891dcdc04fdcbf138b36615d034d985e8c7d4353c41ec64c998e8f48a0f9d7')
sha256sums_aarch64=('4d9f40e8301c751c91d344f03c76d35b295eb9ee0fe19666fd671a2cedbaf241')


check() {
  ./${_appname} version
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
