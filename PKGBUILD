# Maintainer: Flaviu Tamas <aur@flaviutamas.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=pylote
pkgver=1.4
pkgrel=1
pkgdesc="Software making it possible to draw on the screen of the computer, like handling various instruments of geometry."
url="http://pascal.peter.free.fr/wiki/Logiciels/Pylote"
license=('GPL')
arch=('any')
depends=('pyqt')
source=(http://pascal.peter.free.fr/wikiuploads/pylote.tar.gz $pkgname.desktop)
sha256sums=('169540e9e45caa594aa055f7bbfb8f86142e40e3bc75e1eadce510bd488eb3d4'
            '8557e071b14f22e5386715d4769aada56175fa8a266508ce42043363b30b0bd7')

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
