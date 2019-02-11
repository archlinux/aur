# Maintainer: aljazari
# Maintainer: Fabio Loli <lolix@disroot.org>

pkgname=green-recorder
pkgver=3.2.1
pkgrel=1
pkgdesc="A simple yet functional desktop recorder for Linux systems."
arch=('any')
url="https://github.com/foss-project/green-recorder"
license=('GPL3')
depends=('python2-pydbus'
         'libappindicator-gtk3'
         'gawk'
         'python2-gobject'
         'python2-urllib3'
         'xorg-xdpyinfo'
         'xorg-xwininfo'
         'ffmpeg')
optdepends=('gnome-shell: Gnome on Wayland desktop recording.')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/green-project/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('833c1c1961cf5636d449c9d86d669041f65b96560fbf39b27b03d316e1c2e7d8')
 
package() {
  cd "$srcdir/$pkgname-$pkgver"
 
  # desktop file is 755 for some reason
  chmod 644 data/${pkgname}.desktop
 
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
