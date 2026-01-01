# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: tee < teeaur at duck dot com >

_pkgauthor=msoap
_pkgname=shell2http
pkgname=${_pkgname}-bin
pkgdesc="HTTP-server to execute shell commands"

pkgver=1.17.0
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
sha256sums_x86_64=('14b314a501bafa4c3819822fb0bdd1c6d8423ec495432116af184ebfdec3b296')
sha256sums_i686=('23720b2b1df8372c6906a4488620853479cd6efbefa757653a4717ba9a973fb1')
sha256sums_aarch64=('f0a5ac070e32c2654283683f1553d9d9a64b2f5de65418e099a31311f8ff4e64')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"

  install -Dm644 "${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"

  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
