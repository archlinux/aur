# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=liteeth-git
pkgver=115
pkgrel=2
pkgdesc="A small footprint and configurable Ethernet core for litex"
arch=(any)
url="https://github.com/enjoy-digital/liteeth"
license=('MIT')
groups=()
depends=('python' 'migen' 'litex')
provides=('liteeth')
options=(!emptydirs)
install=
source=("git+https://github.com/enjoy-digital/liteeth")
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

