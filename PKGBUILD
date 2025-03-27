# Maintaner: JackMacWindows <jackmacwindowslinux@gmail.com>
# Co-Maintainer: Thomas Girod <tgirod@altu.fr>
# Co-Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=open-stage-control
pkgname=$_pkgname-bin
pkgver=1.28.5
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
sha256sums=('8eab4d21a3ed47dc99f8969ab76298e79e8986835c3399442c6c0422fdd55ce1')
