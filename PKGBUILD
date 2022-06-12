# Original packager: Tobias Frisch <thejackimonster@gmail.com>
# Maintainer: NeoTheFox <soniczerops at gmail.com>

pkgname=protonup-ng-git
_realname=protonup-ng
pkgver=0.1.4.r2.gf60ee76
pkgrel=1
pkgdesc="Install and Update Proton-GE, a version for the new naming convention"
arch=('any')
url="https://github.com/cloudishBenne/protonup-ng"
license=('GPL3')
depends=('python' 'python-requests')
makedepends=('python-setuptools' 'git')
provides=(protonup)
conflicts=(protonup)
options=(!emptydirs)
source=("git+https://github.com/cloudishBenne/$_realname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_realname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_realname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
