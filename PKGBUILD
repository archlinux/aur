# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=thirukguru
_pkgname=logmonster
pkgname=${_pkgname}-bin
pkgdesc="A lightweight CLI utility for Linux/MacOS that detects processes and services writing excessively to log files and consuming disk space"

pkgver=0.1.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('32080aa7efc619678c7d0247f795ab7719400a0a487eafc840ee7c66f0eb57f2')
sha256sums_x86_64=('ed03ab425d2f185454fb14dfb6d2b1b74949256b89ad38b168c4de1f92c7842e')
sha256sums_aarch64=('dc0063d30ce3233146f62b6428ae4b4ad6fe754cdf2ccddbd9ce30024b317469')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
