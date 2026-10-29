# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

_name=queermoji
pkgbase=${_name}-font
pkgname=("ttf-${_name}" "woff-${_name}")
pkgver=0.5.0
pkgrel=1
pkgdesc="Unofficially extending the emoji standard with queer flags, using a ligature-based custom font."
arch=(any)
url="https://queermoji.pronouns.page/"
license=('OFL-1.1 AND ISC AND CC-BY-SA-4.0 AND MIT')
groups=('fonts')

source=("queermoji-${pkgver}.zip::https://queermoji.pronouns.page/Queermoji-${pkgver}.zip")

sha256sums=('42b73e4079b229806eb85737db6f737aa4b49a12f30d4a39e057cb44bdbd85b7')

package_ttf-queermoji() {
	provides=("${pkgbase}")
	install -v -Dm0644 -t "${pkgdir}/usr/share/fonts/TTF/" "${srcdir}"/*.ttf
	install -v -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/LICENSES.md"
}

package_woff-queermoji() {
	provides=("${pkgbase}")
	install -v -Dm0644 -t "${pkgdir}/usr/share/fonts/WOFF/" "${srcdir}"/*.woff2
	install -v -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/LICENSES.md"
}
