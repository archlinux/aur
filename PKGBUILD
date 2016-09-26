# Maintainer: Thomas Scheiblhuber <thomas@scheiblhuber.de>
# Contributor: Joonas Henriksson
# Contributor: Rutger Broekhoff
# Contributor: gatitofeliz at protonmail dot com
pkgname=natron-portable
pkgver=2.1.4
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc='Video compositing software similar to Nuke and Adobe After Effects, portable snapshot'
url='http://natron.fr/'
license=('GPL')
depends=('ffmpeg' 'p7zip')
optdepends=('blender: for 3d opencolor-io support')
conflicts=('natron')

options=('!strip')

source=("natron.desktop" "x-natron.xml" "natronIcon256_linux.png" "natronProjectIcon_linux.png")
source_i686=("https://bitbucket.org/juanperez89/natron/downloads/Natron-2.1.4-Linux-x86_32bit-portable.tar.xz")
source_x86_64=("https://bitbucket.org/juanperez89/natron/downloads/Natron-2.1.4-Linux-x86_64bit-portable.tar.xz")
md5sums=('5c65b106c295abe0b5346eff18a06767' 'ca5186feb5a7f336517c015f72d0f8c8' '60eb9f97a0ddeab5acda48d15894559a' '475e14142c51d8b545f7cbc4b5426ce2')
md5sums_i686=('f3826803f1026b8e9e7bcb43f3d68b48')
md5sums_x86_64=('7e73748a72bc108ce9ccebe15a248462')
sha256sums_i686=('c8d0e391bb8ce59eb06140a0a7025678da351285bfea1778d5118201396b6e63')
sha256sums_x86_64=('697fb2859c8def19536206b68a76ac8028ea18f6e900a7c664cbabee31a3f3d8')
sha384sums_i686=('c916f54aa7796b0e79325c0101e7b15ea633ffb5c2d55e1fca364e611bcfec55138af37729c848d73684d9a1dee2af66')
sha384sums_x86_64=('0c20c8ad24d66e2594b80de9d9cfcc4bf100d22ccf6b5779d36e0f59f58b3dd250e32713c981d77b7d4addfeccfb82ba')
sha512sums_i686=('8b44ce424f774686ee0bf1524ae5fdcf85742d653f38320bc87e128c435a63d4c85a4f366486c5c96999e9e16a7425d527319216cde0052f1f52fc8bba0dcd67')
sha512sums_x86_64=('0c972249494dfd2302fb98dd3cad755e5a0cca7a8feeff6608ed9d77ec0bc19d060f1a79761a3539fbb54877406fe4b9dd78f56824ed40453b82b1057c344a52')
sha1sums_i686=('1ac03c5e50fe9b90e77ec8c7c258ae2c0a4a0307')
sha1sums_x86_64=('8b39506ef0b77416ff9a1b1b5f0e2a902b60acbc')

package() {
	if [ "$CARCH" = "x86_64" ]; then
		_source_arch="x86_64bit"
	else
		_source_arch="x86_32bit"
	fi

	install -d "$pkgdir"/opt
	cp -R "$srcdir"/Natron-$pkgver-Linux-$_source_arch "$pkgdir"/opt/natron

	install -d "$pkgdir"/usr/bin
	ln -s ../../opt/natron/Natron "$pkgdir"/usr/bin/natron
        install -D "$srcdir"/natronIcon256_linux.png "$pkgdir"/usr/share/pixmaps/natronIcon256_linux.png
        install -D "$srcdir"/natronProjectIcon_linux.png "$pkgdir"/usr/share/pixmaps/natronProjectIcon_linux.png
        install -Dm644 "$srcdir"/natron.desktop "$pkgdir"/usr/share/applications/natron.desktop
        install -D "$srcdir"/x-natron.xml "$pkgdir"/usr/share/mime/packages/x-natron.xml
}
