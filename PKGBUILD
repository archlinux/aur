# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unhappychoice
_pkgname=kobito
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="Autonomous coding agent orchestrator — works while you sleep, like the elves in the shoemaker's tale"

pkgver=0.3.3
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('ISC')

provides=("${_appname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.tar.gz")
sha256sums=('a2a2a62cb5a85d7dbb63900d66b87756a9cb01654f3142d9471c0e27d9dfba86'
            'b1bb22815a7468053c92d6701f34db6f7ce4090e9d7e1efd60830d4ead4ee611')
sha256sums_x86_64=('d4c9533c40e297600f9e2dcdda60010084aa6e17ad0b53ff20bd292857d05c18')
sha256sums_aarch64=('0837fa16b787494f0c3ea0fb10439858d93ee97d98532261a01845d55fc07ed8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
