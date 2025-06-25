# Maintaner: JackMacWindows <jackmacwindowslinux@gmail.com>
# Co-Maintainer: Thomas Girod <tgirod@altu.fr>
# Co-Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=open-stage-control
pkgname=$_pkgname-bin
pkgver=1.29.5
pkgrel=1
_dist=${_pkgname}_${pkgver}_linux-x64
pkgdesc='A libre desktop OSC bi-directional control surface application'
arch=(x86_64)
url='http://openstagecontrol.ammd.net/'
license=(GPL3)
depends=(gtk3 libcups libx11 nss)
optdepends=('python-rtmidi: send and receive MIDI messages')
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://github.com/jean-emmanuel/$_pkgname/releases/download/v$pkgver/$_dist.zip")

package() {
  cd $_dist
  install -vdm 755 "$pkgdir"/opt/$_pkgname
  cp -R * "$pkgdir"/opt/$_pkgname

  install -vdm 755 "$pkgdir"/usr/bin
  ln -s /opt/$_pkgname/$_pkgname "$pkgdir"/usr/bin
}
sha256sums=('a68ef296683acd05c49d0bdd2b3de561785c98694ae41e50df16b721d5d767a0')
