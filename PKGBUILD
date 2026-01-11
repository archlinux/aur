# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

#https://github.com/roniel-rhack/rip-go/releases/download/v0.2.2/rip-go-linux-amd64.tar.gz
_pkgauthor=roniel-rhack
_pkgname=rip-go
pkgname=${_pkgname}-bin
pkgdesc="Fuzzy find and kill processes from your terminal with real-time updates"

pkgver=0.2.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}.tar.gz")
sha256sums=('1654036be573fb23122c21f88006be1458b6f6c0a59ccab4501fc10af0a104cc'
            '119f19db041a06b5f93705f6435bc647a86ac2205f2940e2e15517dec193241d')
sha256sums_x86_64=('232f118457a47ab6b0f7cd065d4fb0bf1e702066bb528131bb036367d8234819')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
