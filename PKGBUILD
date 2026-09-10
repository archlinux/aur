# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=romancitodev
_pkgname=cargo-pretty
pkgname=${_pkgname}-bin
pkgver=0.2.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A cargo build wrapper with a live, animated status view"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('GPL-3.0-or-later')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'cargo')

options=('!strip')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.gz")
sha256sums=('f33f205420a12e7f49c5c84e1d35fe66f2f0a61373ad136f9ff15f400cb9064a'
            '4d105a9bb5753da6a00aea2fd5b691af2ac9cde446981d1a2d569c44ab3c0bb9')
sha256sums_x86_64=('509273dd0989b4d89b3d09847f7b6b2bc5d22117b50746802ab9d0cc9a1242ec')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
