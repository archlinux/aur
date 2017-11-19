# Maintainer: George Tokmaji <tokmajigeorge@gmail.com>
pkgname=geogebra-classic
pkgver=6.0.394.0
pkgrel=2
_pkgfile="${pkgname}_${pkgver}-201710241029_amd64.deb"
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet"
arch=('x86_64')
url="http://www.geogebra.org"
license=('CCPL:by-nc' 'CCPL:by-sa' 'GPL3')
depends=('alsa-lib' 'mpfr' 'gtk2' 'libxtst' 'gconf' 'nss' 'nodejs' 'xdg-utils' 'libxss')
source=("http://www.geogebra.net/linux/pool/main/g/geogebra-classic/${_pkgfile}")
sha256sums=('e597891908f6626ea494fd3c856175ef295482cf3149c9ec543bc5863ef9c905')

prepare() {
bsdtar -xf data.tar.xz
echo "StartupWMClass=GeoGebra" >> ./usr/share/applications/geogebra-classic.desktop
}

package() {
install -d $pkgdir/usr
cp -a ./usr/* $pkgdir/usr/
}
