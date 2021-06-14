# Maintainer: Hurstel Alexandre <alexandre at hurstel dot eu>
pkgname=xp-pen-tablet
pkgver=20210605
pkgrel=1
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('GPL')
conflicts=(xp-pen)
source=("https://download01.xp-pen.com/file/2021/06/XP-PEN-pentablet-3.1.4.210605-1.x86_64.tar.gz"
        "install.sh.patch"
)
sha256sums=('ed37236f6a0e51cae3f893e6318231afed71ec487b046cbcdfad72598d12777c'
    '113da219c9ce05a2663ffb5ebb8a48277f9b4dd3ec13431e95290893b395a403'
)

prepare() {
    cd "$srcdir"
    
    patch -p0 < "$srcdir/install.sh.patch"
}


package() {
	cd "$srcdir/xp-pen-pentablet-3.1.4.210605-1.x86_64"
	
	mkdir -p "${pkgdir}/usr/lib/pentablet"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/icons/"
	mkdir -p "${pkgdir}/etc/xdg/autostart"
	mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"
	
	./install.sh "${pkgdir}"
}
