# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Hurstel Alexandre <alexandre at hurstel dot eu>
# Contributor: Tobias Manske <aur at rad4day dot de>

pkgname=xp-pen-tablet
pkgver=3.2.3.220323
pkgrel=3
epoch=1
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
license=('LGPL3')
source=("XPPen-pentablet-${pkgver}-1.${arch}.tar.gz::https://www.xp-pen.com/download/file/id/1936/pid/56/ext/gz.html"
        "install.sh.patch"
)

sha256sums=('70b6dc1345958c1858d091a3d48bdd75c91fcc879ba175739ef9152790bdcb2b'
            '7307056c90591b750fe5c38f5ad0e7f53c6346e14a18413ae544143ddf6f7357')

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
	mkdir -p "${pkgdir}/usr/lib/pentablet/conf/xppen"

	./install.sh "${pkgdir}"
}
