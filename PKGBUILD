# Maintainer: Mikael Blomstrand <gmail: kmbloms>
# Contributor: Paul B <paul2lv@gmail.com>

pkgname=fahviewer
pkgver=7.6.9
pkgrel=1
pkgdesc="Folding@home 3D Simulation Viewer"
url="https://foldingathome.org"
arch=('x86_64')
license=('GPL2')
depends=('glu' 'gtk2' 'freetype2' 'glut')
source=(https://download.foldingathome.org/releases/public/release/${pkgname}/debian-stable-64bit/v${pkgver%.*}/${pkgname}_${pkgver}-64bit-release.tar.bz2)

sha1sums=('d5bc6f2c673654843630999ff7dd7947f2ea00f2')
sha256sums=('14186b8e0fab3d7bf195f8b6a18e6d2e423491a34ac2d75e3a63bc57666f38da')
sha512sums=('e427264dd9057a7fac16ea0e3e671422b5d1fefaf27a7052ceceb54d4224d8a7e5cfcfa21d2a159785427cfd9380e38b9a1cb323db095cfe4a3ef9731df60073')

package() {
	install -dm755 ${pkgdir}/opt/fah/
	cp -rf ${pkgname}_${pkgver}-64bit-release/backgrounds ${pkgdir}/opt/fah/

	install -d "${pkgdir}/usr/bin"
	install -D -m0755 ${srcdir}/fahviewer_${pkgver}-64bit-release/FAHViewer ${pkgdir}/opt/fah/FAHViewer
	ln -s "/opt/fah/FAHViewer" "${pkgdir}/usr/bin/FAHViewer"
}


