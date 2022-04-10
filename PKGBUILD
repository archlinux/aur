# Maintainer: Komeil Parseh <ahmdparsh129@gmail.com>

pkgname=parch-os-wallpapers
pkgver=0.0.1
pkgrel=1
pkgdesc='parch-os wallpapers'
arch=("any")
url="https://github.com/parch-os/artwork"
license=("BSD-3-Clause")
source=("git+https://github.com/parch-os/artwork")
provides=("${pkgname%}")
conflict=("${pkgname%}")
md5sums=('SKIP')

package() {
	cd "$srcdir/artwork/Wallpaper"

	install -d "${pkgdir}/usr/share/wallpapers/${pkgname}/"
	install -m644 */*.png "${pkgdir}/usr/share/wallpapers/${pkgname}/"
	
	# License
	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -m511 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
