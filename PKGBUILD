# Maintainer: Hurstel Alexandre <alexandre at hurstel dot eu>
pkgname=xp-pen-tablet
pkgver=20210331
pkgrel=1
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('GPL')
source=("https://download01.xp-pen.com/file/2021/04/xp-pen-pentablet_3.1.0.210331-1.x86_64.tar.gz"
        "xp-pen-pentablet_3.1.0.210331.x86_64.patch"
)
sha256sums=('9e50510d0f6afaad349e6182d6a275ad1527cc02ed90251620c38a37b0486d12'
    '7593456c18b0ef5b1aff718cfbb4ab8058cd26a9d39af786232a8231772a3c24'
)

prepare() {
    cd "$srcdir"
    
    patch -p0 < "xp-pen-pentablet_3.1.0.210331.x86_64.patch"
}


package() {
	cd "xp-pen-pentablet_3.1.0.210331.x86_64"
	
	mkdir -p "${pkgdir}/usr/lib/pentablet"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/icons/"
	mkdir -p "${pkgdir}/etc/xdg/autostart"
	mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"
	
	./install.sh "${pkgdir}"
}
