# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=rohansx
_pkgname=workz
pkgname=${_pkgname}-bin
pkgdesc="Git worktrees that actually work (zero-config dep sync, fleet mode for parallel agents)"

pkgver=0.8.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.tar.gz")
sha256sums=('54ee49ea52ee0d6acd8a103639c9760b83ec5b3aae10f27f7957d81b57e65c0b'
            '7f6af1b49f6b14bbc5d462025fcf48eecce61ec01366aef8dc506d2c9dc115f2')
sha256sums_x86_64=('bf1e41764e4a0421a44677d6695a56d36232690e53da7e4a9b088898e8ab5424')
sha256sums_aarch64=('ad9509162864efa8e15b3b9e7de753ad2f9db3b5cf3aafe39e9748f95768eabe')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
