# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname=nodejs-leapp-cli
_pkgname=${pkgname#nodejs-}
pkgver=0.1.43
pkgrel=1
pkgdesc="Leapp's Command Line Interface."
arch=('any')
url="https://www.npmjs.com/package/@noovolari/leapp-cli"
license=('MPL2')
makedepends=('npm')
depends=('leapp' 'nodejs')
source=("https://registry.npmjs.org/@noovolari/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('61dfd04842146cc0109a2ab7e22fd86873aa7a7889e64f1a063e05a7c817054b')

package() {
	npm install -g --cache "$srcdir/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	chown -R root:root "${pkgdir}"
}
