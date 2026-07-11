# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dlvhdr
_pkgname=gh-dash
pkgname=${_pkgname}-bin
pkgver=4.25.2
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A beautiful CLI dashboard extension for GitHub to display pull requests and issues with filters you care about"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.txt")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux-${_barch[0]}")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux-${_barch[1]}")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux-${_barch[2]}")
sha256sums=('117cd32c5954b647feabda604744aa9621e28120bab0c3a93abe0e0b8106813d'
            '04451e7f458d16694db2292c0da48139f2787fb68e0784a1021a462e7a2cc342')
sha256sums_x86_64=('1546f8ceb193d0bed2d4ee4470e0a8a789f4ce5c75383b0037305c125f5bbce5')
sha256sums_i686=('b1f9978adb04e715f7934a3a6c9ae5c1d57373326c3f90c4650b066837c70594')
sha256sums_aarch64=('4fe4fc59b9847030653fbc1268f156e13db3218ece63f0eebbb2115aa3c3366d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
