# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=altlimit
_pkgname=sitegen
pkgname=${_pkgname}-bin
pkgdesc="Sitegen is a simple but flexible static site generator."

pkgver=1.0.36
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.txt")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}")
sha256sums=('7b35c3ad261e47afe1a19105b30158c833e3872fa335c12d2019a3dffac4bad8'
            '1d9ea865074fbbf9c4fd61ee0b36ad684b69f8ed7c2d083464484ada5cac243c')
sha256sums_x86_64=('4f4083aebf109d3df5ae09903b528c055bbdb654f2ef416aae2e7302c5acd7a8')
sha256sums_aarch64=('03ec1cd66e48c43d9481ff232bfa2c1ecd6e0c0c25f85bdd4ccb51a746333bf8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
