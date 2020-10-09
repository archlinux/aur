# Maintainer: kostyalamer < kostyalamer@yandex.ru >
# Contributor: kostyalamer
pkgname=icedisk
pkgver=0.1
pkgrel=2
pkgdesc="Special script for IceArch distro to cfdisk and formating partitions "
arch=('x86_64')
url="https://icearch.forumotion.eu/"
license=('GPL2')

depends=(
  'coreutils' 'grep' 'gawk' 'bc' 'sed' 'util-linux' 'dialog'
  'reiserfsprogs' 'exfat-utils' 'ntfs-3g' 'xfsprogs' 'filesystem' 'gptfdisk'
)

source=("http://altlinuxclub.ru/arhiv/${pkgname}-${pkgver}.tar.gz")
md5sums=('8be072e2f4a51adf2b1fabef327be852')

build() {
cd "${srcdir}/${pkgname}-${pkgver}"
cat > $pkgname.desktop <<@@@
[Desktop Entry]
Type=Application
Name=IceDisk
Icon=/usr/share/icewm/icons/save_32x32.png
TryExec=icedisk
Exec=icedisk
Terminal=true
Categories=System;Filesystem;
@@@
}


package() {

cd "$srcdir/$pkgname-$pkgver"
install -pDm755 $pkgname $pkgdir/usr/bin/$pkgname
install -pDm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

}
