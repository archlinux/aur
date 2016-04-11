# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="ccsm"
_pkgver=0.8.12
_micro=.3

pkgname=ccsm
pkgver="${_pkgver}${_micro}"
pkgrel=1
pkgdesc="Compizconfig Settings Manager in Python2"
arch=('any')
url="https://github.com/compiz-reloaded/${_upstream}/"
license=('GPL')
depends=('compizconfig-python' 'gtk2' 'python2-gobject')
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

sha256sums=('ad33ac4729126534b5ebfddbc1e04d0eb1dbd44d8c05471022e0a1f104ca9e08')
