# Contributer: giacomogiorgianni@gmail.com 

pkgname=backupto
_name=BackupTo
pkgver=1.0
pkgrel=3
pkgdesc="kde backup easy and fast"
arch=(686 x86_64)
url="http://opendesktop.org/content/show.php/BackupTo?content=149622"
license=('GPL')
depends=('qt4')
source=("http://opendesktop.org/CONTENT/content-files/149622-$_name.zip" "$_name.desktop")
md5sums=('b8cad31a1ef17b613cefd3453dcea4c5' '5c61b35ad59bb6fc74e3d01542d74f7a')

build() {
  cd "$srcdir/$_name"

  qmake-qt4 $_name.pro -r -config release \
    "CONFIG+=LINUX_INTEGRATED" \
    "INSTALL_ROOT_PATH=$pkgdir/usr/"
   make  
  install -D -m755 $_name ${pkgdir}/usr/bin/$pkgname
  install -Dm644 $srcdir/$_name/Icone/qtcreator_logo_16.png "$pkgdir/usr/share/pixmaps/qtcreator_logo.png"
  install -D -m644 ${srcdir}/$_name.desktop ${pkgdir}/usr/share/applications/$_name.desktop
  #make
  #make INSTALL_ROOT=${pkgdir} install
}