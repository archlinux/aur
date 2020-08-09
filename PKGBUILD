# Maintainer: Kat Witten <turtlewit@live.com>
pkgname=sprytile
pkgver=0.5.10
pkgrel=1
pkgdesc="A blender addon for creating tile based low spec 3D scenes."
arch=('any')
url="https://github.com/Sprytile/Sprytile"
license=('MIT')
depends=('blender')
source=("${pkgname}-${pkgver}"::"https://github.com/Sprytile/Sprytile/archive/v${pkgver}.tar.gz")
md5sums=('cc7a0ebb992dd3b61d4b19d8cc838ff0')

package() {
	cd "Sprytile-$pkgver"
	addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ' | cut -b -4)/scripts/addons"

	install -dm755 "${addons}/SpryTile"
	install -d "${pkgdir}/usr/share/licenses/sprytile"

	install license.txt "${pkgdir}/usr/share/licenses/sprytile/LICENSE"
	cp -r ./ "${addons}/SpryTile/"
}
