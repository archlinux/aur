# Maintainer: Nicolas Quiénot <niQo @ aur>

pkgname=airfoilspeakers
pkgver=3.2.7
pkgrel=3
pkgdesc="Airfoil Speakers for Linux enables Airfoil to send any audio to Linux machines."
url="http://www.rogueamoeba.com/airfoil/"
arch=('i686' 'x86_64')
license=('custom')
depends=('mono' 'avahi' 'mono-zeroconf' 'alsa-lib' 'gcc-libs')
source=(http://rogueamoeba.com/airfoil/download/AirfoilSpeakersLinux.tgz)
md5sums=('9b2a9fba465ed60f42dec138c7360667')

package() {
  cd "$pkgname"
  mkdir -p ${pkgdir}/usr/{bin,lib/airfoilspeakers,share/pixmaps,share/applications}
  
  cp ./bin/* ${pkgdir}/usr/bin/
  cp -R ./lib/* ${pkgdir}/usr/lib/airfoilspeakers/
  cp ./pixmaps/* ${pkgdir}/usr/share/pixmaps/
  cp -R ./applications/* ${pkgdir}/usr/share/applications/

  rm ${pkgdir}/usr/lib/airfoilspeakers/*ARM.so

#  ## DLLs fix
#  ## see http://kevin.colyar.net/2009/12/fixing-airfoil-speakers-for-ubuntu/
#  ## http://kevin.colyar.net/wp-content/uploads/2009/12/Airfoil-DLLs.zip
#  cd ${srcdir}/Airfoil\ DLLs/
#  cp *.dll ${pkgdir}/usr/lib/airfoilspeakers/
}
