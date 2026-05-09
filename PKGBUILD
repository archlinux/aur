# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Rolv-Apneseth
_pkgname=clipvault
pkgname=${_pkgname}-bin
pkgver=1.2.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Clipboard history manager for Wayland, inspired by cliphist"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=(' AGPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            'fbbddfcb7d51dff3e2b99d76f2b1366ee64a9eb5b5993d9168420039ad0acfd9')
sha256sums_x86_64=('07d579ef727d67d9c517bf86d75505aaf5aa19399076bc19b1e993ff09d59ba4')
sha256sums_aarch64=('5a74c90b176a860fb2d8a39ba98c3032e90a37aafe83ee787517f2b8ce4aadb1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
