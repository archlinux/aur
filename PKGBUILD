# Maintainer: Paul Bastian <paul.bastian@posteo.de>
pkgname=arch-maintenance
pkgver=0.1.0
pkgrel=2
pkgdesc="Scripts and services to support arch maintenance"
arch=('any')
url="https://github.com/paulbastian/arch-maintenance"
license=('APACHE')
source=("https://raw.githubusercontent.com/paulbastian/arch-maintenance/main/checkUpdates.sh"
        "https://raw.githubusercontent.com/paulbastian/arch-maintenance/main/checkPackageUpdates.service"
        "https://raw.githubusercontent.com/paulbastian/arch-maintenance/main/checkPackageUpdates.timer")
sha256sums=('38be1f7fe09324d4863a289c95492e40b0e563a0e741e4268eabad636091681b'
            '5f61e678a4d2ae696354edc39dc0bb23a9c8af0cc5d09e693f5ff133d13e492a'
            '747b82bead371ddead15dc2a3b674203cb0079cff89bb156f07807c123e92f64')

package() {	
  cd "$srcdir"

  mkdir -p "${pkgdir}"/usr/share/arch-maintenance
  install -D -m644 checkUpdates.sh "$pkgdir/usr/share/arch-maintenance/checkUpdates.sh" 
  
  install -m644 -Dt "$pkgdir/usr/lib/systemd/system" checkPackageUpdates.service
  install -m644 -Dt "$pkgdir/usr/lib/systemd/system" checkPackageUpdates.timer
}
