# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=M-Igashi
_pkgname=headroom
pkgname=${_pkgname}-bin
pkgdesc="Audio loudness analyzer and gain adjustment tool for mastering workflows"

pkgver=1.6.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'ffmpeg' 'mp3rgain')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${arch[0]}.tar.gz")
sha256sums=('45f62ea4b8704c36e13c62bdafb15076fc8bf618b9722496534193700a7f61bc'
            '31b22e666493fb90db39f7483e3efe298bb0068512b1d27dab9fe7044c7b7854')
sha256sums_x86_64=('b21b4232c747ffaade44d9a66e668f5f533401e44220ead313d6ef615e697789')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
