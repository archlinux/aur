# Maintainer: kostyalamer < kostyalamer@yandex.ru >
# Contributor: kostyalamer
pkgname=montirovka
pkgver=0.1
pkgrel=2
pkgdesc="Special script for IceArch distro to mounting or umounting partitions "
arch=('x86_64')
url="https://icearch.forumotion.eu/"
license=('GPL2')

depends=(
  'coreutils' 'grep' 'gawk' 'bc' 'sed' 'util-linux'
  'reiserfsprogs' 'exfat-utils' 'ntfs-3g' 'xfsprogs' 'filesystem' 
)

source=("http://altlinuxclub.ru/arhiv/${pkgname}-${pkgver}.tar.gz")
md5sums=('f88740419c62606e0641fcd6c73c5d59')

build() {
cd "${srcdir}/${pkgname}-${pkgver}"
cat > $pkgname.desktop <<@@@
[Desktop Entry]
Type=Application
Name=Montirovka
Icon=/usr/share/icons/gnome/48x48/devices/drive-harddisk.png
TryExec=montirovka
Exec=montirovka
Terminal=true
Categories=System;Filesystem;
@@@
}


package() {

cd "$srcdir/$pkgname-$pkgver"
install -pDm755 $pkgname $pkgdir/usr/bin/$pkgname
install -pDm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

}
