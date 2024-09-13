# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
pkgname=nodejs-tslib
_pkgname=${pkgname#nodejs-}
pkgver=2.7.0
pkgrel=2
pkgdesc='runtime library for TypeScript that contains all of the TypeScript helper functions'
url='https://www.typescriptlang.org/'
license=('0BSD')
arch=('any')
makedepends=('npm')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
#noextract=("${_pkgname}-${pkgver}.tgz")
b2sums=('4ec92849c266ca844f4440987c9bd1d1e7b5ccfba6290e7802c65defe69aced38d8ebddb9731e64dbadc42af409e7b737926e281e33daec3c01944218919c42b')
package() {
	npm install --offline --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

	install -Dm644 "package/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

