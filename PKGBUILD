# Maintainer: Gicu GORODENCO <cyclopsihus 'at' gmail 'dot' com>

# The full build fails because of some 32-bit libraries dependency which is difficult to track
# So KISS - Keep It Simple, Stupid - just take the already compiled binaries from repository ;-)

pkgname=lib32-avahi
pkgver=0.6.31
pkgrel32=15
pkgrel=13
pkgdesc="A multicast/unicast DNS-SD framework"
arch=('x86_64')
url="http://www.avahi.org/"
depends=('expat' 'lib32-libdaemon' 'lib32-glib2' 'lib32-dbus-core' 'lib32-libcap' 'lib32-gdbm' 'avahi')
license=('LGPL')
groups=lib32
source=(http://mirrors.kernel.org/archlinux/extra/os/i686/${pkgname/lib32-/}-${pkgver}-${pkgrel32}-i686.pkg.tar.xz)
sha256sums=('f3ec6c522a881d5151c02ed922b614a064ef33cdfe174e28e0912f8ac8427175')

package() {
	mkdir -p ${pkgdir}/usr/lib32
	cp -rPf ${srcdir}/usr/lib/*.so* ${pkgdir}/usr/lib32
}
