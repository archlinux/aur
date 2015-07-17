# Contributor: Dirk Sohler <spam@0x7be.de>               
# Maintainer: Hunter Jones <hjones2199 at gmail dot com>
# vim: ts=4:sw=4

pkgname=worldpainter
pkgver=1.11.1
pkgrel=1
pkgdesc='An interactive map generator for Minecraft'

url='http://www.worldpainter.net/'
arch=('any')
license=('GPLv3')

depends=('java-runtime')
optdepends=('minecraft: for playing the exported maps')

source=("http://www.worldpainter.net/files/${pkgname}_${pkgver}.tar.gz"
		'worldpainter.png'
		'worldpainter.desktop'
		'launch-script')
sha256sums=('00a0519db43aab2120dfd1908b24591539476b6d61a47c843cce5208ab5559d3'
            'a93cd4af0e8ef470f48a8dd2773fb9d83a5302f1b9bfba67f43b4ec7500a039e'
            '6bdff6cdee30f78887d3d602ad3e06d202e50ea737a5c30831ad3fef5ebfd3ca'
            '31548f2fbfe224651b7df023697f6c024377816b09192af229284c8fe939aaed')



package() {
	cd ${srcdir}
	tar xf ${pkgname}_${pkgver}.tar.gz

	install -dm755 ${pkgdir}/opt/$pkgname/{bin,lib,.install4j}
	install -dm755 ${pkgdir}/usr/share/{pixmaps,applications}

	install -Dm644 ${srcdir}/$pkgname/bin/* \
		${pkgdir}/opt/$pkgname/bin/

	install -Dm644  ${srcdir}/$pkgname/lib/* \
		${pkgdir}/opt/$pkgname/lib/

	install -Dm644 ${srcdir}/$pkgname/*.vmoptions \
		${pkgdir}/opt/$pkgname/

	install -Dm755 ${srcdir}/$pkgname/worldpainter \
		${pkgdir}/opt/$pkgname/

	install -Dm755 ${srcdir}/$pkgname/.install4j/* \
		${pkgdir}/opt/$pkgname/.install4j

	install -Dm755 ${srcdir}/worldpainter.png \
		${pkgdir}/usr/share/pixmaps/

	install -Dm755 ${srcdir}/launch-script \
		${pkgdir}/usr/bin/worldpainter

	install -Dm644 ${srcdir}/worldpainter.desktop \
		${pkgdir}/usr/share/applications/worldpainter.desktop
}
