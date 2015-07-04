# Maintainer: Justin Wong <i(at)bigeagle(dot)me>

pkgname=udevedu-git
_pkgname=udevedu
pkgver=0.r13.26a521f
pkgrel=1
pkgdesc="Udev event dispatcher for unprivileged users"
arch=('i686' 'x86_64')
url="https://github.com/xiaq/udevedu"
license=('GPL')
depends=('python-pyudev')
makedepends=('git')
sha256sums=('SKIP')
source=("${pkgname}::git+https://github.com/xiaq/${_pkgname}.git")

pkgver() {
  cd "${pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "$srcdir/${pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
