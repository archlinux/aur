# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=litevideo-git
pkgver=201
pkgrel=1
pkgdesc="Small footprint and configurable video cores"
arch=(any)
url="https://github.com/enjoy-digital/litevideo"
license=('MIT')
groups=()
depends=('python' 'migen' 'litex')
provides=('litevideo')
options=(!emptydirs)
install=
source=("git+https://github.com/enjoy-digital/litevideo")
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

