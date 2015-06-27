pkgname=ogremeshy-bin
pkgver=1.5
pkgrel=1
pkgdesc="Ogre Meshy is a tool for viewing OGRE mesh files."
arch=('x86_64')
url="http://sourceforge.net/projects/ogremeshy/"
license=('GPL3')
depends=('ogre' 'wxgtk')
source=("http://sourceforge.net/projects/ogremeshy/files/$pkgver%20%28Ogre%201.9.0%29/OgreMeshy.${pkgver}b.Kubuntu64__Ogre_1.9.0.tar.bz2"
        "ogremeshy.desktop")
provides=('ogremeshy')
conflicts=('ogremeshy')
md5sums=('fc311f4b09a8090b75fb163da7e5638d'
         'a8ec805fc905323d24532d841b442c1c')

package() {
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/opt/ogremeshy
	mkdir -p ${pkgdir}/opt/ogremeshy/Plugins
	mkdir -p ${pkgdir}/opt/ogremeshy/Resources
	
	cp ${srcdir}/OgreMeshy $pkgdir/opt/ogremeshy
	cp ${srcdir}/Plugins.cfg $pkgdir/opt/ogremeshy
	cp $srcdir/*.so* $pkgdir/opt/ogremeshy
	cp -r $srcdir/Resources/* $pkgdir/opt/ogremeshy/Resources
	cp -r $srcdir/Plugins/* $pkgdir/opt/ogremeshy/Plugins

	ln -s -f /opt/ogremeshy/OgreMeshy $pkgdir/usr/bin/ogremeshy
	install -D -m644 ${srcdir}/ogremeshy.desktop ${pkgdir}/usr/share/applications/ogremeshy.desktop
}
