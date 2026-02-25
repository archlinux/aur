# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mrkatebzadeh
_pkgname=cheshmak
pkgname=${_pkgname}-bin
pkgdesc="Minimal, configurable project status banner for your terminal"

pkgver=0.1.1
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

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('4c236b56dd4c09fa2659e6abc3c58659c25db3d9ad7cbff1b94b6ceec5e3556d')
sha256sums_x86_64=('f8c1157e271e18a5fa2225d71ac4101640c539b08cb4a2fcc2a751a59c270519')
sha256sums_aarch64=('5e512632cea14cfd8446e368d5b61745f17b9cc27b61ee7c24f2f0d68e056a14')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
