# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=qccrypt
pkgver=0.8.0
pkgrel=1
pkgdesc='A cross-plateform frontend for ccrypt software'
arch=('i686' 'x86_64')
url="http://qccrypt.free.fr/"
license=('GPL2')
depends=('ccrypt' 'libxcb' 'qt5-base')
source=("http://qccrypt.free.fr/download/qccrypt-${pkgver}-src.zip" qccrypt.desktop x-cpt.xml qccrypt.xml x-cpt.desktop)

build() {
	cd "${srcdir}/qccrypt-${pkgver}-src"
	qmake-qt5
	make
}

package() {
	cd "${srcdir}/qccrypt-${pkgver}-src"
	install -Dm755 qccrypt "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 ressources/images/qccrypt.png "${pkgdir}/usr/share/pixmaps/qccrypt.png"
	cd "${srcdir}"
	install -Dm644 qccrypt.desktop "${pkgdir}/usr/share/applications/qccrypt.desktop"
	install -Dm644 x-cpt.xml "${pkgdir}/usr/share/mime/application/x-cpt.xml"
	install -Dm644 qccrypt.xml "${pkgdir}/usr/share/mime/packages/qccrypt.xml"
	install -Dm644 x-cpt.desktop "${pkgdir}/usr/share/mimelnk/application/x-cpt.desktop"
}

md5sums=('edf10d1d52cc3c2044ead8cc741363a0'
         '97cb84c58093cb6474476baf9482e3f0'
         'bf60d5c11809910d2a9c98aaa8217911'
         '14af5e3ee3813b1812145cf20defdb70'
         '2217be2566623c28288e3bbb6f9e9922')
