# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kunchenguid
_pkgname=treehouse
pkgname=${_pkgname}-bin
pkgdesc="Manage worktrees without managing worktrees"

pkgver=1.1.5
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.tar.gz")
sha256sums=('44ae5a8e025f2f876e9962fb40dface1977408f7ff3bc0f246933a32da8be94e'
            '1b962d20f826f6a758c737f8aa4e8e76dc719b8aa78fcfacdfb46681bb36c2f4')
sha256sums_x86_64=('0f22e3570e68355e543991bc9c133e0e0b17b5ed0c27045afe5d6b72e29fa98f')
sha256sums_aarch64=('24d8ad3bb01f94c7a47a573a7ca3c25c2b6b64247d9eca98eba1da5ab393595e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
