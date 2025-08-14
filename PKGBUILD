# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=qvtfpp-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A Qt6 QImageIO plugin to load VTF textures."
arch=('x86_64')
url="https://github.com/craftablescience/qvtfpp"
license=('LGPL-2.1-only')
depends=('glibc' 'gcc-libs' 'qt6-base' 'libglvnd')
provides=("${pkgname::-4}" "${pkgname::-6}")
conflicts=("${pkgname::-4}" "${pkgname::-6}")
source=("$url/releases/download/v${pkgver}/qvtf++-${pkgver}-Linux.rpm")
noextract=()
sha256sums=('3c258f2001529f98a1d493e2caf807bcf762e48f2c9d9441305ca31001c9a254')
validpgpkeys=()

package() {
	cd "$srcdir"
	install -Dm755 usr/lib64/qt6/plugins/imageformats/libqvtfpp.so "$pkgdir/usr/lib/qt6/plugins/imageformats/libqvtfpp.so"
	install -Dm644 usr/share/licenses/qvtfpp/LICENSE "$pkgdir/usr/share/licenses/${pkgname::-4}/LICENSE"
	install -Dm644 usr/share/mime/packages/${pkgname::-4}.xml "$pkgdir/usr/share/mime/packages/${pkgname::-4}.xml"
}
