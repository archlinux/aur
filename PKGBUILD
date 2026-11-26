# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=timabell
_pkgname=gitopolis
pkgname=${_pkgname}-bin
pkgdesc="CLI tool to manage multiple git repositories; run commands, clone, and organize repos with tags"

pkgver=1.18.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('AGPL-3.0-only')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
sha256sums=('42e3087e30064582b6af0ee8d63ed25664e9d5c4afdd957e8b49ac40100dadc1'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('a6388c31991fd9115d33d51173dd498a9ec563e8f02084d5e3ec7283c78c52df')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
