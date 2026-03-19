# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=FlerAlex
_pkgname=enseal
pkgname=${_pkgname}-bin
pkgdesc="Secure, ephemeral secret sharing for developers"

pkgver=0.17.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${arch[0]}-unknown-linux-musl.tar.gz")
sha256sums=('6fa8f8a6cb3f7213499822112fab74806917ca9d84c8daf588f3de21049d74bb'
            '04320b46c5ddec9c36bfb4450623ffd3041334930202272742bb52b58d67062a')
sha256sums_x86_64=('76091f3b8c5217e9e2eaa9d2d78fa5f02219ebe7d7672086239495a233784e82')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE"-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
