# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ricardodantas
_pkgname=tickit
pkgname=${_pkgname}-bin
pkgdesc="A stunning terminal-based task manager with CLI and TUI"

pkgver=0.5.8
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('ba2bd40e5ada1613ca048c4d6be5222224d670af0d20c0802b70d18441ce780e'
            '670ff3dbdf83b81d06ef9bf176d45ee29e5346f65d58aa256316f917a967356f')
sha256sums_x86_64=('c1792f767a5a0706b0d1599e950cb199da44c233a498d6da6bedf017be0fd3f7')
sha256sums_aarch64=('606a37322ea9fad3677673eabf5859ccee60e505e33de8dd3ab68bebcd6e2eab')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
