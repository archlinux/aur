# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=roniel-rhack
_gitname=rip-go
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Fuzzy find and kill processes from your terminal with real-time updates"

pkgver=0.2.3
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_gitauthor}/${_gitname}"
_urlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_gitname}-linux-${_barch[0]}.tar.gz")
sha256sums=('1654036be573fb23122c21f88006be1458b6f6c0a59ccab4501fc10af0a104cc'
            '3d24a044f9c281f18b02d318bce9f17514ce5e434a4ef16211fce721b359ebaa')
sha256sums_x86_64=('40c50a81e46415fd3d0979bd29a46b6adc40401f2b738c507d035ac75c04f63b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
