# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
pkgname=nodejs-types-geojson
_pkgname=${pkgname#nodejs-}
pkgver=7946.0.14
pkgrel=3
pkgdesc='type definitions for geojson'
url='https://github.com/DefinitelyTyped/DefinitelyTyped/tree/master/types/geojson'
license=('MIT')
arch=('any')
makedepends=('npm')
source=("https://registry.npmjs.org/@types/geojson/-/geojson-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
b2sums=('20806fba4c8d717c3b82322de9cdd63bfae3139c9d913a558a55e6cd04451ddfdf0f334677afd4b226f25b44fd393c54b08e373db4cfb2b451f89062f447a889')

package() {
	npm install --offline --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname#types-}-${pkgver}.tgz"

	install -Dm644 "${_pkgname#types-}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

