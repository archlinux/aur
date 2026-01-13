# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=M-Igashi
_pkgname=mp3rgain
pkgname=${_pkgname}-bin
pkgdesc="Lossless MP3 volume adjustment - A modern 'mp3gain' replacement"

pkgver=1.1.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${arch[0]}.tar.gz")
sha256sums=('45f62ea4b8704c36e13c62bdafb15076fc8bf618b9722496534193700a7f61bc'
            '7dfc07ada98e81a2fcdbd549c197d1a5c699067528adf0041b47b5c4ea0a8659')
sha256sums_x86_64=('f3d2a03f07bc53b5d2ef39c696a8233512dfdfbe230cda7bfa18205a0be2afed')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
