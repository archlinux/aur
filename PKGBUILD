# Maintainer: Mikael Blomstrand <gmail: kmbloms>
# Contributor: Paul B <paul2lv@gmail.com>

pkgname=fahviewer
pkgver=7.6.8
pkgrel=1
pkgdesc="Folding@home 3D Simulation Viewer"
url="http://folding.stanford.edu/English/HomePage"
arch=('x86_64')
license=('GPL2')
depends=('glew' 'gtk2' 'freetype2' 'glut')
source=(https://download.foldingathome.org/releases/public/release/fahviewer/debian-stable-64bit/v${pkgver%.*}/fahviewer_${pkgver}-64bit-release.tar.bz2)

sha1sums=('23163ebc3b648aa45b829d64eebd2976c7f49106')
sha256sums=('a2c2c90e081d013fd4d273c5c8e6d6a62fdcc87fb8e0b04eda927d476d1aacc0')
sha512sums=('8846db077e67ad04bc7f74176199b201eedd4b01954d42157acb7f3193eff7ad133339361014302835f659273a4c64e5021993974b98bff2abb04e8a4e775f67')

package() {
	cd ${srcdir}
	install -dm755 ${pkgdir}/opt/fah/
	cp -rf fahviewer_${pkgver}-64bit-release/backgrounds ${pkgdir}/opt/fah/

	install -d "${pkgdir}/usr/bin"
	install -D -m0755 ${srcdir}/fahviewer_${pkgver}-64bit-release/FAHViewer ${pkgdir}/opt/fah/FAHViewer
	ln -s "/opt/fah/FAHViewer" "${pkgdir}/usr/bin/FAHViewer"
}


