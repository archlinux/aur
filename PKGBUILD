# Maintainer: SanskritFritz (gmail)
# Contributor: David J. Haines <djhaines at gmx dot com>
# Contributor: Benjamin Hodgetts (Enverex) <ben@xnode.org>

_pkgname=pioneer
pkgname=$_pkgname-bin
pkgver=20240314
pkgrel=1
pkgdesc="A freeform single player space adventure in the spirit of Frontier: Elite II."
arch=('x86_64')
url="http://pioneerspacesim.net/"
license=('GPL')
conflicts=('pioneer' 'pioneer-git')
provides=('pioneer')
depends=('libsigc++' 'libvorbis' 'sdl2_image' 'freetype2' 'libpng' 'assimp')
optdepends=('libtxc_dxtn: may prevent crashes on ATI hardware')
# [ "$CARCH" = "i686" ] && _carch_bits=32
[ "$CARCH" = "x86_64" ] && _carch_bits=64
PKGEXT='.pkg.tar'

source=("$_pkgname.png" "$_pkgname.desktop" "$_pkgname.sh")
source_x86_64=("https://github.com/pioneerspacesim/pioneer/releases/download/$pkgver/pioneer-linux-x64-${pkgver}.tar.gz")

package() {
	install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
	install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
	cd "pioneer-linux-x64-$pkgver"
	find . -type d -exec mkdir -p "$pkgdir/usr/share/pioneer/{}" \;
	find . -type f -exec cp '{}' "$pkgdir/usr/share/pioneer/{}" \;
	mkdir -p "$pkgdir/usr/bin"
}

md5sums=('46e51941124eb3cf1af9233820223478'
         '1f05200234c41b4320f59de80534669c'
         '9e61ce70a75f6b9ad0fd5cab5d0b7420')
md5sums_x86_64=('f5e9dda453bbdd618c76fefac7d0d43d')
# md5sums_i686=('feee66ae6071fdc0421d028ff43df492')
