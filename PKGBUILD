# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=python-trayer-git
provides=python-trayer
pkgver=0.0.1
pkgrel=1
pkgdesc="System Tray Icons for GTK4"
url="https://github.com/enne2/trayer"
arch=(x86_64)
license=(MIT)
depends=(
  glibc
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("git+https://github.com/Enne2/trayer")
b2sums=('SKIP')

prepare() {
  cd $pkgname
}

build() {
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="$pkgdir" $pkgname/dist/*.whl
  install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
