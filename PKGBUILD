# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ricardodantas
_pkgname=folder-declutter
pkgname=${_pkgname}-bin
pkgdesc="A folder declutter program that delete files after some pre-defined time"

pkgver=0.4.14
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${pkgver}")
sha256sums=('553a9c43fa788c665438b6cf17fd326ce1d63450bd37f06e3d39fcc7efcf5330'
            '8338830e0fe1d27c658bccf256c39181dcc134652f86098566989d58ec4731b1')
sha256sums_x86_64=('bdef4767ea3d56dae873800cb3c3446ed9dc075ce9c652fa3407ce0119a059c1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
