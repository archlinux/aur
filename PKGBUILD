# Maintainer: LightDot <lightdot -a-t- g m a i l>

_pkgname=polkit-efl
pkgname=$_pkgname-git
pkgver=0.1.0.r8.g6417565
pkgrel=1
pkgdesc="Enlightenment polkit authentication agent using EFL - development version."
arch=('any')
url="http://www.enlightenment.org"
license=('GPL3' 'LGPL')   # LGPL for icons
depends=('python-efl' 'polkit')
makedepends=('git' 'mesa')
optdepends=('python-psutil: For process details')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://git.enlightenment.org/misc/$_pkgname.git")
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
  python setup.py install --root="${pkgdir}"
}
