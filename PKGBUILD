# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=bluewho
pkgver=0.2.2
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
md5sums=('9e5853ee2ace518931beb05954757250')
sha1sums=('c91c7e98acb446d48569bfff26105412954ff539')
sha256sums=('022c112ef934213f6ed64f870fb7948e14c61a638bbfcd82f0e6f470c2d338fc')

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}

