# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=polkit-efl
pkgname=$_pkgname-git
pkgver=0.1.0.r4.gf74c2d4
pkgrel=1
pkgdesc="Polkit Authentication Agent using EFL - Development version"
arch=('any')
url="http://www.enlightenment.org"
license=('GPL3' 'LGPL: Icons')
depends=('python-efl' 'polkit')
makedepends=('git')
optdepends=('python-psutil: For process details')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/misc/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"

  python setup.py install --root="$pkgdir"
}
