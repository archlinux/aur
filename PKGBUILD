# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Bengerthelorf
_pkgname=bcmr
pkgname=${_pkgname}-bin
pkgdesc="cp with progress bar"

pkgver=0.3.23
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${arch[0]}-linux.tar.gz")
sha256sums=('1a1600e7355b11cc1e69a6a361269e3c9a64f73d6c0b5958fe48f4861053bfd7'
            '2a0da400ebb421c5b6f9a0df9a849a00beca33be89a527d83cc30c7bca19727c')
sha256sums_x86_64=('95dc696fe8d51cff84ae6225de5adb80871ff9983ead2f5bbac4da6169046c23')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
