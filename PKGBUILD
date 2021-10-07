# Maintainer: Paul Bastian <paul.bastian@posteo.de>
pkgname=arch-maintenance
pkgver=0.1.0
pkgrel=6
pkgdesc="Scripts and services to support arch maintenance"
arch=('any')
url="https://github.com/paulbastian/arch-maintenance"
license=('APACHE')
source=("https://raw.githubusercontent.com/paulbastian/arch-maintenance/main/checkUpdates.sh"
        "https://raw.githubusercontent.com/paulbastian/arch-maintenance/main/checkPackageUpdates.service"
        "https://raw.githubusercontent.com/paulbastian/arch-maintenance/main/checkPackageUpdates.timer")
sha256sums=('35ab4aa19e54043d14b0ea48dddd77b126084046dacfaa1582655f2212849ef8'
            '1c0a68380d1916c038e31e079c6eb67cf268e4354fb80998e66ea70b32a2a10e'
            '747b82bead371ddead15dc2a3b674203cb0079cff89bb156f07807c123e92f64')

package() {	
  cd "$srcdir"

  mkdir -p "${pkgdir}"/usr/share/arch-maintenance
  install -D -m755 checkUpdates.sh "$pkgdir/usr/share/arch-maintenance/checkUpdates.sh" 
  
  install -m644 -Dt "$pkgdir/usr/lib/systemd/system" checkPackageUpdates.service
  install -m644 -Dt "$pkgdir/usr/lib/systemd/system" checkPackageUpdates.timer
}
