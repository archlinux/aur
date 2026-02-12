# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unhappychoice
_pkgname=gittype
pkgname=${_pkgname}-bin
pkgver=0.9.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Turn your source code into typing challenges"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc' 'zlib' 'git')

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('5a98b5d392059c1c9dabe3b084fb85f2f4176ced31bcbe27f8191634b09962e1'
            '7d3884e3483b0d8d53cd33e291b38317d9e80283030ef17a8ec3396b1d5efca7')
sha256sums_x86_64=('52c79762aa84b09fc50a76a1fdf749cac278a6dc8af5d56fc2c2853f0d9532b3')
sha256sums_aarch64=('a26361973a3bf246b5fc24326822b45d74c248c7a5f8b74c86a3559777b09649')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
