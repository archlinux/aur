# Maintainer: Lotte V
# Contributor: Lotte V
pkgname=gnomekiss
pkgver=2.0
pkgrel=8
pkgdesc="KiSS paper doll viewer for GNOME"
arch=('x86_64')
url="https://devel.tlrmx.org/kiss/"
license=('GPL-2.0')
groups=('gnomekiss')
depends=('dconf' 'at-spi2-core' 'glibc' 'cairo' 'libcanberra' 'gdk-pixbuf2' 'glib2' 'gtk3' 'lha' 'freetype2')
source=("${pkgname}-${pkgver}.deb::https://cloud.debian.org/images/snapshot/pool/main/g/${pkgname}/${pkgname}_${pkgver}-${pkgrel}_amd64.deb")
md5sums=('1b7dd5ab558d6c6b183eabb9045da150')
sha256sums=('9dff68ec175b52a517f574d1662fbbf19613ba378a1b7d4d202c868a6ae6159e')

package() {
	cd "$srcdir"

	local_deb_file="$pkgname-$pkgver.deb"

	ar x "$local_deb_file" data.tar.xz

	bsdtar -xf data.tar.xz -C "$pkgdir"
}
