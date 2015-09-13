# Maintainer: xeyqe <xeyqe@seznam.cz>
pkgname=saturnus
pkgver=1	#?
pkgrel=0	#?
pkgdesc="A dark red scalable icon theme."
arch=('any')
url="http://linux.softpedia.com/get/Desktop-Environment/Icons/Saturnus-55030.shtml"
license=('GPLv3')
source=("http://www.gnome-look.org/CONTENT/content-files/120145-${pkgname}.tar.bz2")
md5sums=('395d773f72ea23e9fddad25e0f6a2e2c')

package() {
	cd "$pkgname"
	perl -pi -e 's/128/54/g' index.theme
	perl -pi -e 's/64/32/g' index.theme
	
	install -m755 -d "${pkgdir}/usr/share/icons/saturnus/scalable/mimetypes"
	install -m755 -d "${pkgdir}/usr/share/icons/saturnus/scalable/places"
	install -m755 -d "${pkgdir}/usr/share/icons/saturnus/scalable/status"
	
	install -m644 index.theme "${pkgdir}/usr/share/icons/saturnus/"
	install -m644 scalable/mimetypes/* "${pkgdir}/usr/share/icons/saturnus/scalable/mimetypes/"
	install -m644 scalable/places/* "${pkgdir}/usr/share/icons/saturnus/scalable/places/"
	install -m644 scalable/status/* "${pkgdir}/usr/share/icons/saturnus/scalable/status/"
}
