# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=litedram-git
pkgver=181
pkgrel=1
pkgdesc="A small footprint and configurable DRAM core"
arch=(any)
url="https://github.com/enjoy-digital/litedram"
license=('MIT')
groups=()
depends=('python' 'migen' 'litex')
provides=('litedram')
options=(!emptydirs)
install=
source=("git+https://github.com/enjoy-digital/litedram")
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

