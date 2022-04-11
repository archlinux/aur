# Maintainer: Komeil Parseh <ahmdparsh129@gmail.com>

pkgname=parch-os-wallpapers
pkgver=1.0.0.r0.gf9fc0f6
pkgrel=1
pkgdesc='parch-os wallpapers'
arch=("any")
url="https://github.com/parch-os/artwork"
license=("BSD")
source=("git+https://github.com/parch-os/artwork")
conflict=("${pkgname%}")
md5sums=('SKIP')
makedepends=('git')

package() {
	cd "$srcdir/artwork/Wallpaper"

	install -d "${pkgdir}/usr/share/wallpapers/${pkgname}/"
	install -m644 */*.png "${pkgdir}/usr/share/wallpapers/${pkgname}/"
	
	# License
	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -m511 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

pkgver() {
    cd "$srcdir/artwork"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
