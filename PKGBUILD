# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=protonup-git
_realname=protonup
pkgver=0.1.3
pkgrel=1
pkgdesc="Install and Update Proton-GE"
arch=('any')
url="https://github.com/AUNaseef/protonup"
license=('GPL')
depends=('python')
makedepends=('python-setuptools' 'git')
options=(!emptydirs)
source=("git+https://github.com/AUNaseef/$_realname.git")
sha256sums=('SKIP')
provides=('protonup')

pkgver() {
	cd "$srcdir/$_realname"
	cat setup.cfg | grep 'version = ' | awk '{print $3}'
}

package() {
  cd "$srcdir/$_realname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
