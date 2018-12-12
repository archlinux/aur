# Contributor: Dirk Sohler <spam@0x7be.de>               
# Contributor: Hunter Jones <hjones2199 at gmail dot com>
# Maintainer: Thomas Bork <tab dot epic at gmail dot com>
pkgname=worldpainter
pkgver=2.5.8
pkgrel=1
pkgdesc='An interactive map generator for Minecraft'

url='https://www.worldpainter.net/'
arch=('x86_64')
license=('GPL')

depends=('java-environment' 'sh' 'lib32-libxi')
optdepends=('minecraft: for playing the exported maps')

source=("http://www.worldpainter.net/files/${pkgname}_${pkgver}.tar.gz"
		'worldpainter.png'
		'worldpainter.desktop'
		'launch-script')
sha256sums=('20404a0b58b34d026aaae4e17c7e002e3067d2401322ff013c5c16a053920b45'
            'a93cd4af0e8ef470f48a8dd2773fb9d83a5302f1b9bfba67f43b4ec7500a039e'
            '669f78518b75b441f4382cfd14e207dd91ee1dc967383db1771ec202dbb07cb4'
            'fd64d11450f03c8924cbc133a009b3373bc5f80b2589b63391b65db04d82963f')

package() {
	cd "${srcdir}"
	tar xf worldpainter_${pkgver}.tar.gz

	install -dm755 ${pkgdir}/opt/worldpainter/{bin,lib,.install4j}
	install -dm755 ${pkgdir}/usr/share/{pixmaps,applications}

	install -Dm644 ${srcdir}/$pkgname/bin/* ${pkgdir}/opt/$pkgname/bin/

	install -Dm644  ${srcdir}/$pkgname/lib/* ${pkgdir}/opt/$pkgname/lib/

	install -Dm644 ${srcdir}/$pkgname/*.vmoptions ${pkgdir}/opt/$pkgname/

	install -Dm755 ${srcdir}/$pkgname/worldpainter ${pkgdir}/opt/$pkgname/

	install -Dm755 ${srcdir}/$pkgname/.install4j/* ${pkgdir}/opt/$pkgname/.install4j

	install -Dm755 ${srcdir}/worldpainter.png ${pkgdir}/usr/share/pixmaps/

	install -Dm755 ${srcdir}/launch-script ${pkgdir}/usr/bin/worldpainter

	install -Dm644 ${srcdir}/worldpainter.desktop ${pkgdir}/usr/share/applications/worldpainter.desktop
}
