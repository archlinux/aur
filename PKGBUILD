# Maintainer: Hurstel Alexandre <alexandre at hurstel dot eu>
# thanks to Tobias Manske <aur@rad4day.de> for version 20210623 
pkgname=xp-pen-tablet
pkgver=20210623
pkgrel=1
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('GPL')
conflicts=(xp-pen)
source=("https://download01.xp-pen.com/file/2021/07/XP-PEN-pentablet-3.1.4.210623-1.x86_64.tar.gz"
        "install.sh.patch"
)
sha256sums=('1f7583b461565c6b94600f0aa2d92ae03c51f532e9041beeb91eaa354063861e'
    '447f49e7d5136418bbbc210a555833a6e4909e26d6ce3564d27775eab1039d25'
)

prepare() {
    cd "$srcdir"
    
    patch -p0 < "$srcdir/install.sh.patch"
}


package() {
	cd "$srcdir/xp-pen-pentablet-3.1.4.210623-1.x86_64"
	
	mkdir -p "${pkgdir}/usr/lib/pentablet"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/icons/"
	mkdir -p "${pkgdir}/etc/xdg/autostart"
	mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"
	
	./install.sh "${pkgdir}"
}
