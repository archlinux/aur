# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname="gtk-theme-ambiance-ds-blue-sb12"
pkgver=2.60
pkgrel=1
pkgdesc="A theme based on Ambiance (gtk2, gtk3, gnome-shell, metacity, unity)"
arch=(any)
#url="http://gnome-look.org/content/show.php/Ambiance+DS+BlueSB12?content=154519"
url="https://www.gnome-look.org/p/1013664/"
license=('GPL')
depends=('gtk-engine-unico' 'gtk-engine-murrine')
conflicts=()

# Hash and Timestamp
_p="var \(hash = '\(.*\)\|timetamp = '\(.*\)\)';"
read _s _t <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\2\3/p"))

source=("https://dl.opendesktop.org/api/files/downloadfile/id/1524565560/s/$_s/t/$_t/u//AmbianceDSBlueSB12.tar.xz")
md5sums=('cb0e9d251304afdab8f1575dc2e9b5b0')
install=()

package() {
# 	bsdtar -xf ${srcdir}/ambiance_blue_theme_suite_by_satya164-d396ttt.zip
mkdir -p ${pkgdir}/usr/share/themes
cp -R ${srcdir}/Ambiance* ${pkgdir}/usr/share/themes/
cd ${pkgdir}/usr/share/themes/
find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;
}
