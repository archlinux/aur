# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname=nodejs-leapp-cli
_pkgname=${pkgname#nodejs-}
pkgver=0.1.32
pkgrel=1
pkgdesc="Leapp's Command Line Interface."
arch=('any')
url="https://www.npmjs.com/package/@noovolari/leapp-cli"
license=('MPL2')
makedepends=('npm')
depends=('leapp' 'nodejs')
source=("https://registry.npmjs.org/@noovolari/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('a4ffe8aa2a3368f468a9996ad0f59b454d25eacdf5dc7935f45ada64fffd5082')

package() {
	npm install -g --cache "$srcdir/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	chown -R root:root "${pkgdir}"
}
