# Maintainer: mirandir <mirandir@orange.fr>

pkgname=magiccollection
pkgver=0.8.118
pkgrel=1
pkgdesc="Magic Collection is a small program to manage your collection of Magic: the Gathering cards."
arch=('any')
license=('GPL3')
depends=('gtk3' 'python' 'python-gobject' 'python-cairo')
url="http://mirandir.pagesperso-orange.fr/magiccollection/"
source=(http://mirandir.mcollection.free.fr/files/releases/"$pkgname"_"$pkgver".tar.xz)
sha256sums=('cf1f71f4de80e742c5646c8463e84525933a8e7abafbd5da30a970960726b3b1')

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
