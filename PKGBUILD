# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=liteiclink-git
pkgver=99
pkgrel=1
pkgdesc="Small footprint and configurable Inter-Chip communication cores"
arch=(any)
url="https://github.com/enjoy-digital/liteiclink"
license=('MIT')
groups=()
depends=('python' 'migen' 'litex')
provides=('liteiclink')
options=(!emptydirs)
install=
source=("git+https://github.com/enjoy-digital/liteiclink")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  git rev-list --count HEAD
}

prepare() {
  cd "${srcdir}/${pkgname%%-git}"
  rm -rf test/__init__.py
  rm -rf example_designs/__init__.py
}

build() {
  cd "${srcdir}/${pkgname%%-git}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname%%-git}"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

