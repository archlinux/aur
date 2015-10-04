# Maintainer: Flaviu Tamas <tamas.flaviu@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=pylote
pkgver=1.3
pkgrel=1
pkgdesc="Software making it possible to draw on the screen of the computer, like handling various instruments of geometry."
url="http://pascal.peter.free.fr/wiki/Logiciels/Pylote"
license=('GPL')
arch=('any')
depends=('pyqt')
source=(http://pascal.peter.free.fr/wikiuploads/pylote.tar.gz $pkgname.desktop)
md5sums=('d7a1128ab7991a465c17a40e640c4bdb'
         '551a544d0f99fff8b4061167ba3b4dd8')

package() {
  cd ${srcdir}/${pkgname}
  mkdir -p ${pkgdir}/usr/share/{$pkgname,applications}
  mkdir -p ${pkgdir}/usr/bin
  cp -R * ${pkgdir}/usr/share/$pkgname
  echo "#!/usr/bin/bash
        cd '/usr/share/pylote/' && python pylote.pyw" > ${pkgdir}/usr/bin/pylote
  chmod +x ${pkgdir}/usr/bin/pylote
  cp ${srcdir}/pylote.desktop ${pkgdir}/usr/share/applications
}
