# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=qvtfpp-bin
pkgver=1.0.0
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
sha256sums=('34a6ed7fa58046f7d320d0685f42ce9f3f479f84c08d49b4e1265d981a277416')
validpgpkeys=()

package() {
	cd "$srcdir"
	install -Dm755 usr/lib64/qt6/plugins/imageformats/libqvtfpp.so "$pkgdir/usr/lib/qt6/plugins/imageformats/libqvtfpp.so"
	install -Dm644 usr/share/licenses/qvtfpp/LICENSE "$pkgdir/usr/share/licenses/${pkgname::-4}/LICENSE"
	install -Dm644 usr/share/mime/packages/${pkgname::-4}.xml "$pkgdir/usr/share/mime/packages/${pkgname::-4}.xml"
}
