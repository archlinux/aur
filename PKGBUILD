_pkgbase=gimp
pkgname=lib32-gimp
pkgver=2.8.18
pkgrel=5
pkgdesc="GNU Image Manipulation Program (32-bit)"
arch=('x86_64')
url="http://www.gimp.org/"
depends=( 'lib32-glibc' 'lib32-cairo' 'lib32-gdk-pixbuf2' 'lib32-glib2' 'lib32-pango' 'gimp')
license=('GPL' 'LGPL')
source=(https://www.archlinux.org/packages/extra/i686/gimp/download/#gimp-i686.pkg.tar.xz)
md5sums=('702ce43552b9eba15b6e857a009d5f7a')
pkgver() {
        cat $srcdir/.PKGINFO | grep -oP '(?<=pkgver = )\d+\.\d+\.\d+'
}
package() {
	mkdir -p ${pkgdir}/usr/lib32
	cp -rPf ${srcdir}/usr/lib/*.so* ${pkgdir}/usr/lib32
	install -dm755 "${pkgdir}"/usr/share/licenses
	ln -s ${_pkgbase} "${pkgdir}"/usr/share/licenses/${pkgname}
}
