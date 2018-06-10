# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=litejesd204b-git
pkgver=259
pkgrel=1
pkgdesc="A small footprint and configurable JESD204B core"
arch=(any)
url="https://github.com/enjoy-digital/litejesd204b"
license=('MIT')
groups=()
depends=('python' 'migen' 'litex')
provides=('litejesd204b')
options=(!emptydirs)
install=
source=("git+https://github.com/enjoy-digital/litejesd204b")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  git rev-list --count HEAD
}

prepare() {
  cd "${srcdir}/${pkgname%%-git}"
  rm -rf test/__init__.py
}

build() {
  cd "${srcdir}/${pkgname%%-git}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname%%-git}"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

