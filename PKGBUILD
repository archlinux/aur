# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname=nodejs-leapp-cli
_pkgname=${pkgname#nodejs-}
pkgver=0.1.33
pkgrel=1
pkgdesc="Leapp's Command Line Interface."
arch=('any')
url="https://www.npmjs.com/package/@noovolari/leapp-cli"
license=('MPL2')
makedepends=('npm')
depends=('leapp' 'nodejs')
source=("https://registry.npmjs.org/@noovolari/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('311023b57f5f9d751f61bd3af9c95b182d368b8dffc36fa77f12d40a0184fbfc')

package() {
	npm install -g --cache "$srcdir/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	chown -R root:root "${pkgdir}"
}
