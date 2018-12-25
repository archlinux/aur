
# Maintainer: Your Name <youremail@domain.com>
pkgname=paranoid-git
pkgver=r53.dc9496c
pkgrel=1
epoch=2
pkgdesc="GTK+3 configuration tool for compton."
arch=('any')
url="https://github.com/semplice/paranoid"
license=('GPL')
depends=('compton')
makedepends=('git')
provides=('paranoid')
conflicts=('paranoid')
sha512sums=('SKIP')
source=("git+https://github.com/semplice/paranoid")
epoch=1

pkgver() {
  cd "paranoid"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/paranoid"
  python setup.py build
}

package() {
  cd "$srcdir/paranoid"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D paranoid.glade $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
