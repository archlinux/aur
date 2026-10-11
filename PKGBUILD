# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: tee < teeaur at duck dot com >

_pkgauthor=msoap
_pkgname=shell2http
pkgname=${_pkgname}-bin
pkgdesc="HTTP-server to execute shell commands"

pkgver=1.18.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('3ed8190f54bcb545087545d2eeded54088f826a4b32937559548f09607ae0769')
sha256sums_i686=('5492bdf23865808c31ccbbf45ab6bdaa2d7343b41fa6d5927aa22e16f1d1cb07')
sha256sums_aarch64=('e2fb1bc107ef69e61167996c3db08e1e1564761545d8570f26b744b5f4b15d81')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"

  install -Dm644 "${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"

  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
