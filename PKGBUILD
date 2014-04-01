pkgname=wacom-utility
pkgver=1.21
pkgrel=3
pkgdesc="Graphical tablet configuration utility"
arch=('i686' 'x86_64')
url="http://gtk-apps.org/content/show.php/Wacom+Control+Panel?content=104309&PHPSESSID=e1fe54f464f2242b5d1f6c3661757ebf"
license=('GPL')
depends=('gtk2' 'python2' 'pygtk' 'xf86-input-wacom' 'gksu')
source=("http://ppa.launchpad.net/hughescih/ppa/ubuntu/pool/main/w/${pkgname}/${pkgname}_${pkgver}-3.tar.gz" wacom-utility.desktop)

md5sums=('51ff9257b6e0c511ee57d40cd76742ec'
         '1d44b3571fd5e48b80b2dec5209fcf47')
build() {
  tar xvf ${pkgname}_${pkgver}-3.tar.gz
  rm ${pkgname}_${pkgver}-3.tar.gz
  rm -r ${srcdir}/${pkgname}/*.pyc
  rm -r ${srcdir}/${pkgname}/debian
  rm ${srcdir}/${pkgname}/wacom-utility.desktop
  mkdir -p ${pkgdir}/usr/share/applications
  cp wacom-utility.desktop ${pkgdir}/usr/share/applications
  cp -r ${srcdir}/${pkgname} ${pkgdir}/usr/share
}
