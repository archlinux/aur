# Maintainer: Hurstel Alexandre <alexandre at hurstel dot eu>
# Co-Maintainer: Tobias Manske <aur at rad4day dot de>
pkgname=xp-pen-tablet
pkgver=3.2.1.211019
epoch=1
pkgrel=1
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('LGPL3')
conflicts=(xp-pen)
source=("https://download01.xp-pen.com/file/20${pkgver: -6:2}/11/XP-PEN-pentablet-${pkgver}-1.${CARCH}.tar.gz"
        "install.sh.patch"
)
sha256sums=('46c1bafe6cd4d9e33b9ebb4697a4183275bbc63e59e73be4e78ae12204e75493'
            'ae59e8006eb79b6a623e0b3cc1063d337c789d9fd5f1ea5aceedb743e955c085')

prepare() {
    cd "$srcdir/xp-pen-pentablet-${pkgver}-1.${CARCH}"

    patch < "$srcdir/install.sh.patch"
}


package() {
    cd "$srcdir/xp-pen-pentablet-${pkgver}-1.${CARCH}"

	mkdir -p "${pkgdir}/usr/lib/pentablet"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/icons/"
	mkdir -p "${pkgdir}/etc/xdg/autostart"
	mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"

	./install.sh "${pkgdir}"
}
