# Maintainer : André Fettouhi <a.fettouhi@gmail.com>
# Contributor : Noctivivans  <noctivivans@gmail.com>

pkgname=gog-planescape-torment
pkgver=1.0.0.6
pkgrel=3
pkgdesc="Sigil... A place with gates that lead anywhere in existence, provided you have the proper key."
arch=("i686" "x86_64")
url="http://www.gog.com/game/planescape_torment"
license=("custom")
groups=("games")
source=("local://gog_planescape_torment_${pkgver}.tar.gz" "gog-planescape-torment")
sha256sums=('e574accb26e6ae20876386b926df8c982bb7ccda8ffc70154915b291fb571845'
            '21d8d21cab91ab140380273d430ecf98cf95abb3a1fe7f6ca03657e97d6da9c1')
depends=(freetype2 wine)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
mkdir -p "${pkgdir}"/opt/gog/planescape-torment
mv "${srcdir}"/Planescape\ Torment/prefix/drive_c/GOG\ Games/Planescape\ Torment/* "${pkgdir}"/opt/gog/planescape-torment
sed -i s/'HD0:=.\+'/'HD0:=C:\\planescape-torment\\'/ "${pkgdir}"/opt/gog/planescape-torment/Torment.ini
sed -i s/'CD1:=.\+'/'CD1:=C:\\planescape-torment\\data\\'/ "${pkgdir}"/opt/gog/planescape-torment/Torment.ini
sed -i s/'CD2:=.\+'/'CD2:=C:\\planescape-torment\\data\\'/ "${pkgdir}"/opt/gog/planescape-torment/Torment.ini
sed -i s/'CD3:=.\+'/'CD3:=C:\\planescape-torment\\data\\'/ "${pkgdir}"/opt/gog/planescape-torment/Torment.ini
sed -i s/'CD4:=.\+'/'CD4:=C:\\planescape-torment\\data\\'/ "${pkgdir}"/opt/gog/planescape-torment/Torment.ini
sed -i s/'CD5:=.\+'/'CD5:=C:\\planescape-torment\\data\\'/ "${pkgdir}"/opt/gog/planescape-torment/Torment.ini
install -Dm644 "${srcdir}"/Planescape\ Torment/support/gog-planescape-torment-primary.desktop "${pkgdir}"/usr/share/applications/gog-planescape-torment.desktop
install -Dm644 "${srcdir}"/Planescape\ Torment/support/gog-planescape-torment.png "${pkgdir}"/usr/share/pixmaps/gog-planescape-torment.png
install -Dm644 "${srcdir}"/Planescape\ Torment/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
install -Dm755 "${srcdir}/gog-planescape-torment" "${pkgdir}/usr/bin/gog-planescape-torment"
}
