#Maintainer: Bob <animalbob03 at gmail dot com>
#Contributor: <p dot j dot heslin at durham dot ac dot uk>
#The contributor field lists the original creator of the package. This PKGBUILD simply moves the default of /usr/local/diogenes to /opt/diogenes, which I consider a more appropriate location, and uses the system libraries included with the libglvnd package rather than the bundled versions.
#This package does NOT provide database files; they are not distibuted with Diogenes and generally cost money to obtain. If you need help finding them, feel free to email me for assistance.
pkgver=4.5
pkgname='diogenes-bin'
_pkgname='diogenes'
pkgrel=2
license=('GPL3')
arch=('x86_64')
url="https://d.iogen.es/d/index.html"
pkgdesc="Application for searching and browsing legacy databases of texts in Latin and ancient Greek."
source=("https://github.com/pjheslin/diogenes/releases/download/4.5/$_pkgname-$pkgver.pkg.tar.xz")
sha512sums=('030d67fd8fcdf2aba0a8631aac95a4bc1c7d82ae23c1274f7a37b01b58a2bdb09545e6c9c4c50f37d021dc064ee36c36485774c4af6bdbb7291f678995bf4018')
depends=('perl' 'libglvnd')
conflicts=('diogenes')
package() {
	cd "${pkgdir}"
	mkdir opt/
	cp -r ${srcdir}/usr ./
	mv usr/local/diogenes opt/
	mkdir usr/local/bin
	ln -sf /opt/diogenes/diogenes usr/local/bin
	ln -sf /usr/lib/libGLESv2.so opt/diogenes/
	ln -sf /usr/lib/libGLESv2.so opt/diogenes/swiftshader/
	ln -sf /usr/lib/libEGL.so opt/diogenes/
	ln -sf /usr/lib/libEGL.so opt/diogenes/swiftshader/
}
