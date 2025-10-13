# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=AndreLeclercq
_pkgname=sshctl
pkgname=${_pkgname}-bin
pkgver=0.2.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="SSH connection manager CLI tool"
arch=('x86_64')
_barch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[0]}.tar.xz")
sha256sums=('e7f548f1aa97fa7643e69bbca7eb0527defb3ea4ccca1d8871df9b5a2a6821fa'
            '5fbc74dd0dffb6115dafcbc5a63ceca04011002c421bd4db6c135b4d2e421923')
sha256sums_x86_64=('ee787929ccdb5a76724d2e5dd2dbb9d4ae2dc8fc55db2d79d9bd1bd0b8a6fc2e')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
