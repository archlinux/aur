# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=rohansx
_pkgname=workz
pkgname=${_pkgname}-bin
pkgdesc="Git worktrees that actually work (zero-config dep sync, fleet mode for parallel agents)"

pkgver=0.7.0
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
sha256sums=('d994f287bcf23f452f7277c0f5b414e293ba4d74fa5c8baad2d79bab6b813b89'
            '7f6af1b49f6b14bbc5d462025fcf48eecce61ec01366aef8dc506d2c9dc115f2')
sha256sums_x86_64=('dc6d51f7ee7022d085a60191bba8923601fd25ddd84f82d10d8edf6e2fcc2e6b')
sha256sums_aarch64=('fa7b80d76790fee8b35e0f25f460c8cef393d4e4053c80e631eb879112a8e565')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
