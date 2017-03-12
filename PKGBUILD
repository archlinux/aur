# Maintainer: mirandir <mirandir@orange.fr>

pkgname=magiccollection
pkgver=0.8.117
pkgrel=1
pkgdesc="Magic Collection is a small program to manage your collection of Magic: the Gathering cards."
arch=('any')
license=('GPL3')
depends=('gtk3' 'python' 'python-gobject')
url="http://mirandir.pagesperso-orange.fr/magiccollection/"
source=(http://mirandir.pagesperso-orange.fr/files/"$pkgname"_"$pkgver".tar.xz)
sha256sums=('28f7b42cc687059291bb0a4e207facc3de3b6f06003c92934293fbc9af2e681f')

package() {
        cd "$srcdir"

        install -d $pkgdir/usr/share/{applications,magiccollection}
        install -d $pkgdir/usr/share/magiccollection/{functions,images,objects,translations}
        install -d $pkgdir/usr/share/icons/hicolor
        cp -r functions/* $pkgdir/usr/share/magiccollection/functions/
        cp -r images/* $pkgdir/usr/share/magiccollection/images/
        cp -r objects/* $pkgdir/usr/share/magiccollection/objects/
        cp -r translations/* $pkgdir/usr/share/magiccollection/translations/
        cp -r icons_os/hicolor/* $pkgdir/usr/share/icons/hicolor/
        
        cp defs.py $pkgdir/usr/share/magiccollection
        cp gpl3.txt $pkgdir/usr/share/magiccollection
        cp magic_collection.py $pkgdir/usr/share/magiccollection/magic_collection
        chmod +x $pkgdir/usr/share/magiccollection/magic_collection
        cp README.md $pkgdir/usr/share/magiccollection/README
        
        cp magiccollection.desktop $pkgdir/usr/share/applications
}
