# Maintainer: George Tokmaji <tokmajigeorge@gmail.com>
pkgname=geogebra-classic
pkgver=6.0.427.0
pkgrel=1
_pkgfile="${pkgname}_${pkgver}-201802072243_amd64.deb"
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet"
arch=('x86_64')
url="http://www.geogebra.org"
license=('CCPL:by-nc' 'CCPL:by-sa' 'GPL3')
depends=('alsa-lib' 'mpfr' 'gtk2' 'libxtst' 'gconf' 'nss' 'nodejs' 'xdg-utils' 'libxss')
source=("http://www.geogebra.net/linux/pool/main/g/geogebra-classic/${_pkgfile}")
sha256sums=('7611a94d392764e8dbf89137de0dbccd1eaa5a55ebce0b072d6a359061be5dff')

prepare() {
bsdtar -xf data.tar.xz
echo "StartupWMClass=GeoGebra" >> ./usr/share/applications/geogebra-classic.desktop
}

package() {
install -d $pkgdir/usr
cp -a ./usr/* $pkgdir/usr/
}
