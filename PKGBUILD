# Maintainer: Julio <julio@fosc.space>
# Contributor: James Duley <jagduley gmail>


pkgname=librepilot-rpm
pkgver=16.09
pkgrel=1
pkgdesc="A ground control station and firmware for UAV flight controllers"
arch=('x86_64')
url="http://www.librepilot.org"
license=('GPL')
depends=('qt5-svg' 'qt5-serialport' 'qt5-multimedia' 'qt5-quickcontrols' 'sdl' 'libusb')
makedepends=( 'rpmextract' )
conflicts=('librepilot')
replaces=('openpilot')
source=("librepilot.rpm::https://copr-be.cloud.fedoraproject.org/results/parched/LibrePilot/fedora-28-x86_64/00803895-LibrePilot/LibrePilot-16.09+r735~gaba11f0-1.fc28.src.rpm")
md5sums=('17904db84f060964c16a15653bcb33c8')

package() {
  cd $pkgdir
  rpmextract.sh ../../librepilot.rpm

  # Fix different lib naming
  mv usr/lib64/* usr/lib/

  # Clean up unused folders
  rm -rf usr/lib/.build-id
  rmdir usr/lib64
}
