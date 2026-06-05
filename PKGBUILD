# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=roborev-dev
_pkgname=roborev
pkgname=${_pkgname}-bin
pkgdesc="Continuous background code review database for agents, work faster and smarter with accountability for every line of generated code."

pkgver=0.57.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('828a7cc87e4a0a4c3a6d0677060c4a3e697186b50ef5d6ac74236aeec0f01e68'
            'f7440e20d28e4a11ed8ede489f90405e038b4da4d9281bcb1540bf9cde5d9c71')
sha256sums_x86_64=('71a9fbb8422dfa3e6237ee4f135c6fd3d2eb002027bccc611f8e523242ffce26')
sha256sums_aarch64=('267213a47f338cdea99acecf4e9c0a4f43a28870d6e8ab33a7c3af58b615e5e0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
