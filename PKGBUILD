# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bmarse
_pkgname=tododo
pkgname=${_pkgname}-bin
pkgdesc="The todo manager that should be extinct"

pkgver=0.7.0
pkgrel=1
_pkgvername=v${pkgver}-stable

arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[2]}.tar.gz")
sha256sums_x86_64=('f866ae2fefb2d2fdc5b8af92cd6b01d1d3859fcebd63efeb0b5d70a95b818efc')
sha256sums_i686=('31035402bbb7a5b7ebfb32a6b21fd596694131db791c1163d3547f239c89752b')
sha256sums_aarch64=('3b69f234fb9a32d7dde7e4eb855fa04c2c54b6d4611b53f7e876f31a0c9b4339')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
