# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=ccsm-git
pkgver=0.8.10.r2.g4a1bedd
pkgrel=1
pkgdesc="Compizconfig Settings Manager in Python2"
arch=('any')
url="http://git.northfield.ws/compiz/?p=compiz/ccsm;a=summary"
license=('GPL')
depends=("compizconfig-python-git" 'pygtk')
makedepends=('intltool')
optdepends=('compiz-gtk-standalone: option 1' 'compiz-core: option 2' 'python2-sexy: needed for some widgets')
groups=('compiz-fusion' 'compiz-fusion-gtk' 'compiz-fusion-kde')
conflicts=('ccsm')
provides=("ccsm=$pkgver")
source=(
	'git://northfield.ws/compiz/ccsm'
)
install=ccsm.install
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname%%-git}"
  python2 ./setup.py install --prefix=/usr --root="${pkgdir}"
}
