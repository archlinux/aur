# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=ccsm-git
pkgver=0.8.12.2.r0.gef02e91
pkgrel=1
pkgdesc="Compizconfig Settings Manager in Python2"
arch=('any')
url="https://github.com/compiz-reloaded/ccsm"
license=('GPL')
depends=("compizconfig-python-git" 'gobject-introspection')
makedepends=('intltool')
optdepends=('compiz-gtk-standalone: option 1' 'compiz-core: option 2')
groups=('compiz-fusion' 'compiz-fusion-gtk' 'compiz-fusion-kde')
conflicts=('ccsm')
provides=("ccsm=$pkgver")
source=(
	'git+https://github.com/compiz-reloaded/ccsm.git'
)
install=ccsm.install
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname%%-git}"
  python2 ./setup.py install --prefix=/usr --with-gtk=2.0 --root="${pkgdir}"
}
