# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=litesdcard-git
pkgver=188
pkgrel=1
pkgdesc="A small footprint and configurable SDCard core"
arch=(any)
url="https://github.com/enjoy-digital/litesdcard"
license=('MIT')
groups=()
depends=('python' 'migen' 'litex')
provides=('litesdcard')
options=(!emptydirs)
install=
source=("git+https://github.com/enjoy-digital/litesdcard")
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

