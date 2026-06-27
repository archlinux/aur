# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unhappychoice
_pkgname=kobito
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="Autonomous coding agent orchestrator — works while you sleep, like the elves in the shoemaker's tale"

pkgver=0.3.2
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
sha256sums_x86_64=('f9ac08193900873882c012454af0d391296cc7005b0e50d4d548cee3e71ca33a')
sha256sums_aarch64=('b3b88fae13bf8a07c9f8926ca90d172d044d67cd2e53cf0d77e7e2b651c79490')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
