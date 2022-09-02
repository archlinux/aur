# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname=nodejs-leapp-cli
_pkgname=${pkgname#nodejs-}
pkgver=0.1.20
pkgrel=1
pkgdesc="Leapp's Command Line Interface."
arch=('any')
url="https://www.npmjs.com/package/@noovolari/leapp-cli"
license=('MPL2')
makedepends=('npm')
depends=('leapp' 'nodejs')
source=("https://registry.npmjs.org/@noovolari/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('902e29c77e7d8a837b6704489be5c157ebfd494b7ec80968447951cb87579c3b')

package() {
	npm install -g --cache "$srcdir/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	chown -R root:root "${pkgdir}"
}
