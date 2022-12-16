# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=protonup-git
_realname=protonup
pkgver=0.1.4.r9.gd8289b0
pkgrel=1
pkgdesc="Install and Update Proton-GE"
arch=('any')
url="https://github.com/AUNaseef/protonup"
license=('GPL3')
depends=('python' 'python-requests')
makedepends=('python-setuptools' 'git')
provides=(protonup)
conflicts=(protonup)
options=(!emptydirs)
source=("git+https://github.com/AUNaseef/$_realname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_realname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_realname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
