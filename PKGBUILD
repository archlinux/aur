# Maintainer : Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="ccsm"
_pkgver=0.8.18
_micro=""

pkgname=ccsm
pkgver="${_pkgver}${_micro}"
pkgrel=1
pkgdesc="Compizconfig Settings Manager in Python2"
arch=('any')
url="https://gitlab.com/compiz/${_upstream}/"
license=('GPL')
depends=('compizconfig-python' 'python-gobject' 'python-cairo' 'gtk2')
makedepends=('intltool')
optdepends=('compiz-gtk-standalone: option 1' 'compiz-core: option 2')
groups=('compiz-fusion')
conflicts=('ccsm-git')
provides=("ccsm=$pkgver")
source=(
	"${url}-/archive/v${pkgver}/${_upstream}-v${pkgver}.tar.bz2"
)

prepare() {
  cd "${srcdir}/${_upstream}-v${pkgver}"
}

package() {
  cd "${srcdir}/${_upstream}-v${pkgver}"
  python ./setup.py install --prefix=/usr --with-gtk=2.0 --root="${pkgdir}"
}

sha256sums=('0dda29684501fee692fa90f3af29503872dd7c9f6b28353f7ba22e4436ce17f8')
