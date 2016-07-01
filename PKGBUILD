# Maintainer : Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="ccsm"
_pkgver=0.8.12
_micro=.4

pkgname=ccsm
pkgver="${_pkgver}${_micro}"
pkgrel=1
pkgdesc="Compizconfig Settings Manager in Python2"
arch=('any')
url="https://github.com/compiz-reloaded/${_upstream}/"
license=('GPL')
depends=('compizconfig-python' 'gtk2' 'python2-gobject' 'python2-cairo')
makedepends=('intltool')
optdepends=('compiz-gtk-standalone: option 1' 'compiz-core: option 2')
groups=('compiz-fusion')
conflicts=('ccsm-git')
provides=("ccsm=$pkgver")
source=("${url}/releases/download/v${pkgver}/${_upstream}-${pkgver}.tar.xz")
install=ccsm.install

package() {
  cd "${srcdir}/${_upstream}-${pkgver}"
  python2 ./setup.py install --prefix=/usr --with-gtk=2.0 --root="${pkgdir}"
}

sha256sums=('6245280aab20a74863c6a2a47d4c492a9344eff0c6b8e1f03c7efffd0ee2c2b7')
