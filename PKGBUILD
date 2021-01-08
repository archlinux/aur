# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=mygnuhealth-git
_pkgname=mygnuhealth
pkgver=r129.50459c5
pkgrel=1
pkgdesc="The GNU Health Personal Health Record (PHR)"
arch=('any')
url="https://invent.kde.org/pim/mygnuhealth"
license=('GPL3')
depends=('python' 'python-matplotlib' 'python-requests' 'python-tinydb' 'python-bcrypt' 'pyside2')
makedepends=('git' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://invent.kde.org/pim/mygnuhealth.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
