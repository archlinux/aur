# Maintainer: George Tokmaji <tokmajigeorge@gmail.com>
pkgname=geogebra-classic
pkgver=6.0.410.0
pkgrel=1
_pkgfile="${pkgname}_${pkgver}-201712102344_amd64.deb"
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet"
arch=('x86_64')
url="http://www.geogebra.org"
license=('CCPL:by-nc' 'CCPL:by-sa' 'GPL3')
depends=('alsa-lib' 'mpfr' 'gtk2' 'libxtst' 'gconf' 'nss' 'nodejs' 'xdg-utils' 'libxss')
source=("http://www.geogebra.net/linux/pool/main/g/geogebra-classic/${_pkgfile}")
sha256sums=('57adb6cd1c676d1cfbe9ac6c35276d87053ef83dcc4f20c47f46bb4d398335ca')

prepare() {
bsdtar -xf data.tar.xz
echo "StartupWMClass=GeoGebra" >> ./usr/share/applications/geogebra-classic.desktop
}

package() {
install -d $pkgdir/usr
cp -a ./usr/* $pkgdir/usr/
}
