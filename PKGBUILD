# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=roborev-dev
_pkgname=roborev
pkgname=${_pkgname}-bin
pkgdesc="Continuous background code review database for agents, work faster and smarter with accountability for every line of generated code."

pkgver=0.52.0
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
sha256sums=('9120b858bb353c0017331d78e35cc46821588e72a68c287ce75ff0e759f8fce3'
            'f7440e20d28e4a11ed8ede489f90405e038b4da4d9281bcb1540bf9cde5d9c71')
sha256sums_x86_64=('4231663bcbe73f7ce945eaceb37920bbba0eb335a22b2db251973349357e15bc')
sha256sums_aarch64=('8362cdb4ed6e4b9fed2c31414310cade9778525686912c574de7229dee7b2fd1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
