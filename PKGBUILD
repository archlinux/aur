# Maintainer: Hurstel Alexandre <alexandre at hurstel dot eu>
# thanks to Tobias Manske <aur@rad4day.de> for versions 20210623, 20210804
pkgname=xp-pen-tablet
pkgver=20210804
pkgrel=1
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('GPL')
conflicts=(xp-pen)
source=("https://download01.xp-pen.com/file/2021/08/XP-PEN-pentablet-3.2.0.210804-1.x86_64.tar.gz"
        "install.sh.patch"
)
sha256sums=('210d5686de9d789d996b20de8cad01eaa7b591a244c6aaa9f7158a2390771ccf'
    'ae59e8006eb79b6a623e0b3cc1063d337c789d9fd5f1ea5aceedb743e955c085'
)

prepare() {
    cd "$srcdir"

    patch -p0 < "$srcdir/install.sh.patch"
}


package() {
	cd "$srcdir/xp-pen-pentablet-3.2.0.210804-1.x86_64"

	mkdir -p "${pkgdir}/usr/lib/pentablet"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/icons/"
	mkdir -p "${pkgdir}/etc/xdg/autostart"
	mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"

	./install.sh "${pkgdir}"
}
