# Maintainer: George Tokmaji <tokmajigeorge@gmail.com>
pkgname=geogebra-classic
pkgver=6.0.423.0
pkgrel=1
_pkgfile="${pkgname}_${pkgver}-201801270911_amd64.deb"
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet"
arch=('x86_64')
url="http://www.geogebra.org"
license=('CCPL:by-nc' 'CCPL:by-sa' 'GPL3')
depends=('alsa-lib' 'mpfr' 'gtk2' 'libxtst' 'gconf' 'nss' 'nodejs' 'xdg-utils' 'libxss')
source=("http://www.geogebra.net/linux/pool/main/g/geogebra-classic/${_pkgfile}")
sha256sums=('22ea7c6f70d9caa4b33a1c06e5b39048fe5f7aa6ba96d71d4621144da4bb22c7')

prepare() {
bsdtar -xf data.tar.xz
echo "StartupWMClass=GeoGebra" >> ./usr/share/applications/geogebra-classic.desktop
}

package() {
install -d $pkgdir/usr
cp -a ./usr/* $pkgdir/usr/
}
