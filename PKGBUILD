# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=wofr06
_pkgname=csvtable
pkgname=${_pkgname}
pkgdesc="Fault-tolerant viewer for CSV files"

pkgver=1.00
pkgrel=2
_pkgvername=main

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('GPL-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('perl' 'perl-text-csv' 'perl-text-csv-xs')

source=("${_pkgname}-${pkgver}.tgz::${url}/archive/${_pkgvername}.zip")
# source=("${_pkgname}-${pkgver}.tgz::${url}/archive/${_pkgvername}.tar.gz")
sha256sums=('0e3ceefadd31c4db078face53b5f914b0fbb8a77c3de73ee40313b4ac0cdd015')


package() {
	cd "${srcdir}/${pkgname}-${_pkgvername}" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
