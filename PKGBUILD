# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=meowrain
_pkgname=localsend-go
pkgname=${_pkgname}-bin
pkgver=1.2.7
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="CLI implementation of LocalSend protocol in Go"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('28621f9484984c64ca4c97486ba7edc4aaee3e23cc602279de073cf252289d72'
            'f7ae1a26590541dda2f2bce92bc5487ae2fd3468d773fa92adeabbdb56f15884')
sha256sums_x86_64=('103d1a7fcfdcfc4149d3b877e37ccca95aa4de80d9d1a08695bf43ce58463174')
sha256sums_aarch64=('1197a3d7b18b051eec289326c11eb394b171075699fc1505fbcaad04dcf5a535')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
