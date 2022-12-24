# Maintainer: sardo <sardonimous@hotmail.com>
pkgname=oorexx
pkgver=5.0.0
pkgrel=12583
pkgdesc="open source implementation of Object Rexx"
arch=('x86_64')
url="http://www.oorexx.org/"
license=('CPL')
depends=('bash' 'gcc-libs-multilib')
optdepends=('tcsh: for C shell sample'
	    'sh: for sh shell sample')
provides=("rexx")
conflicts=("oorexx-beta")
source=(https://downloads.sourceforge.net/project/oorexx/oorexx/${pkgver}/ooRexx-${pkgver}-${pkgrel}.debian11.x86_64.deb)
sha256sums=('72ce9135b5e05d1a9eff5cec0d9d23804cf8e4a76e2778f85bf4dba1e57ad8d6')
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
