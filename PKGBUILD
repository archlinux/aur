# Maintainer: George Tokmaji <tokmajigeorge@gmail.com>
pkgname=geogebra-classic
pkgver=6.0.417.0
pkgrel=1
_pkgfile="${pkgname}_${pkgver}-201801141926_amd64.deb"
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet"
arch=('x86_64')
url="http://www.geogebra.org"
license=('CCPL:by-nc' 'CCPL:by-sa' 'GPL3')
depends=('alsa-lib' 'mpfr' 'gtk2' 'libxtst' 'gconf' 'nss' 'nodejs' 'xdg-utils' 'libxss')
source=("http://www.geogebra.net/linux/pool/main/g/geogebra-classic/${_pkgfile}")
sha256sums=('3d9a2bccbe01c81d4a34fa60a17dc2daedef3425722768101b09e77bb7e8b107')

prepare() {
bsdtar -xf data.tar.xz
echo "StartupWMClass=GeoGebra" >> ./usr/share/applications/geogebra-classic.desktop
}

package() {
install -d $pkgdir/usr
cp -a ./usr/* $pkgdir/usr/
}
