# Maintainer: aljazari
# Maintainer: Fabio Loli <lolix@disroot.org>

pkgname=green-recorder
pkgver=3.2.3
pkgrel=1
pkgdesc="A simple yet functional desktop recorder for Linux systems."
arch=(any)
url="https://github.com/foss-project/green-recorder"
license=(GPL3)
depends=(python2-dbus python2-gobject python2-urllib3 ffmpeg imagemagick
         xorg-xdpyinfo xorg-xwininfo libappindicator-gtk3 gawk)
optdepends=('gnome-shell: Gnome on Wayland desktop recording')
makedepends=(python2-setuptools)
options=(!emptydirs)
#source=("${pkgname}-${pkgver}.tar.gz::https://github.com/foss-project/green-recorder/archive/${pkgver}.tar.gz"
_commit=(e91de9d4f6becd8180a9147ceb3b289b15f2be50) # v3.2.3
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/foss-project/green-recorder/archive/${_commit}.tar.gz")
sha256sums=('b8033fd2d7011152ce704a6f7ebe9253eddd922a57e8253a8c8ac070c5a61988')
 
package() {
#  cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-${_commit}"
  # desktop file is 755 for some reason
  # chmod 644 data/${pkgname}.desktop
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
