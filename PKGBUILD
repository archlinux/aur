# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=tanciaku
_pkgname=ttypr
pkgname=${_pkgname}-bin
pkgdesc="Terminal Typing Practice"

pkgver=0.3.6
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
sha256sums=('8f8afee246f792a7c8293d755e9ca750b6c4b8419cb5b4713c8a43dd939b66ef'
            'fe9e6fc90b5abf60728ebc36e04f68b4092df09c52b2eb7f9ab5932d1409eca6')
sha256sums_x86_64=('3231fc2f47fca92fe3bdc987554c6104352cf2c4bae216515f7e8a5a29ce64d2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
