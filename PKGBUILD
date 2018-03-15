# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=xcursor-atto
pkgver=1
pkgrel=3
pkgdesc="A non-conventional circular cursor theme, built with pen and touch based input in mind"
arch=('any')
url="https://www.gnome-look.org/p/999542/"
license=('GPL')
depends=()

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1460734305/s/$_s/t/$_t/u//167180-Atto-cursor.tar.gz")
md5sums=('b53e4df14519c675cf973f2f44257555')

package() {
cd ${srcdir}/Atto-cursor
install -dm755 ${pkgdir}/usr/share/icons/
cp -vR * ${pkgdir}/usr/share/icons/
}


