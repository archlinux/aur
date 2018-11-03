# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=gtk-theme-plasma-shock-bolt-fire
pkgver=2.5
pkgrel=1
pkgdesc="Black theme based on Dark Cold"
arch=('any')
url="http://www.xfce-look.org/p/1157147/"
license=('GPL')
depends=('gtk-xfce-engine' 'gtk-engines')

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1540830184/s/$_s/t/$_t/u//themes-oct-18-update2.tar.gz")
md5sums=('c4967bf758561730437ceecbdbf0eae1')

package() {
cd ${srcdir}
install -d "${pkgdir}/usr/share/themes"
#cd Themes/GTK-3.20
cp -R 'Plasma Bolt' ${pkgdir}/usr/share/themes
cp -R 'Plasma Fire' ${pkgdir}/usr/share/themes
cp -R 'Plasma Shock' ${pkgdir}/usr/share/themes
}
