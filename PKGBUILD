# Maintainer: Cody P Schafer <archlinux at codyps.com>
_bpn=python2-shaape
pkgname=${_bpn}-git
pkgver=1.1.1.r2.gc8c8dd7
pkgrel=1
pkgdesc=""
arch=(any)
url="https://github.com/christiangoltz/shaape"
license=('GPL')
groups=()
depends=('python2' 'pygtk')
makedepends=()
provides=(${_bpn})
conflicts=(${_bpn})
replaces=()
backup=()
options=(!emptydirs)
install=
source=(git+https://github.com/christiangoltz/shaape)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/shaape"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/shaape"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
