# Maintainer: Mike Pento <mjpento@gmail.com>

pkgname=oorexx
pkgver=5.2.0
pkgrel=13156
pkgdesc="open source implementation of Object Rexx"
arch=('x86_64')
url="https://sourceforge.net/projects/oorexx/"
license=('CPL')
depends=('bash' 'gcc-libs-multilib' 'libgcc' 'glibc' 'libstdc++')
options+=('!debug')
optdepends=('tcsh: for C shell sample'
	    'sh: for sh shell sample')
provides=("rexx")
conflicts=("oorexx-beta")

source=(https://download.sourceforge.net/project/oorexx/oorexx/${pkgver}/oorexx-${pkgver}-${pkgrel}.debian12.${arch}.deb)

sha256sums=('9129a81dc6e059a203d7736275b68d3f899751a150f9402ec1171f2018842fc6')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xf data.tar.gz -C "$pkgdir/"
	echo "  -> Moving from /usr/local to /usr..."
	mv -v "$pkgdir/usr/local/bin"     "$pkgdir/usr/"
	mv -v "$pkgdir/usr/local/include" "$pkgdir/usr/"
	mv -v "$pkgdir/usr/local/lib"     "$pkgdir/usr/"
	mv -v "$pkgdir/usr/local/share"   "$pkgdir/usr/"
	rm -r "$pkgdir/usr/local"
}
