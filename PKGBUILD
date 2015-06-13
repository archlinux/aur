# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=bluewho
pkgver=0.2.1
pkgrel=1
pkgdesc="Information and notification of new discovered bluetooth devices"
url="http://www.muflone.com/bluewho"
arch=('any')
license=('GPL2')
depends=('gtk3' 'gobject-introspection' 'python2-xdg' 'python2-gobject' 'python2-pybluez' 'gtk-update-icon-cache')
optdepends=('libcanberra: to play notification sound using canberra-gtk-play'
            'alsa-utils: to play notification sound using aplay'
            'libpulse: to play notification sound using paplay'
            'mplayer: to play notification sound using mplayer'
           )
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('df8ab67e21081bcdc3261596f56bc220')
sha1sums=('5892efeceb079d43583aab344e900bd6ce8a0f51')
sha256sums=('dff93c4c88834f6d56bad05851c87890f1a4bc5680642b42d9dd1e9681ab69a8')
install="${pkgname}.install"

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}

