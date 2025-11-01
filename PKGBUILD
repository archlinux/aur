# Maintainer: thr <r at sledinmay dot com>
# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=gtklevel9
pkgver=5.2
pkgrel=1
pkgdesc="An interpreter for British text adventures by Level 9."
arch=(i686 x86_64)
url="http://mirror.ifarchive.org/indexes/if-archiveXlevel9XinterpretersXlevel9.html"
license=('GPL')
depends=('gtk3')
source=("http://mirror.ifarchive.org/if-archive/level9/interpreters/level9/Level9_${pkgver}_Source.zip")
md5sums=('b6f0aa9e4048ad33dc0a7d1b10eb31c0')

build() {
 cd Gtk
 make
}

package() {
 install -D Gtk/gtklevel9 ${pkgdir}/usr/bin/gtklevel9
 ln -s /usr/bin/gtklevel9 ${pkgdir}/usr/bin/level9
 install -D -m644 Gtk/README ${pkgdir}/usr/share/level9/README
 install -D -m644 Gtk/NEWS ${pkgdir}/usr/share/level9/NEWS
 install -D -m644 Gtk/BUGS ${pkgdir}/usr/share/level9/BUGS
 install -D -m644 level9.txt ${pkgdir}/usr/share/level9/level9.txt
 install -D -m644 Gtk/${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
 install -D -m644 Gtk/${pkgname}.png $pkgdir/usr/share/icons/hicolor/32x32/mimetypes/${pkgname}.png
 install -D -m644 Gtk/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
 install -D -m644 Gtk/${pkgname}.xml ${pkgdir}/usr/share/mime/packages/${pkgname}.xml

}
