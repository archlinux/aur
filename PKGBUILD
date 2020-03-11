# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-minitree
pkgver=0.4.1
pkgrel=2
pkgdesc='List files in columns'
arch=(any)
url='https://github.com/xyproto/minitree'
license=(MIT)
depends=(python)
makedepends=(git python-setuptools)
source=("git+$url#commit=cc5e698c7a6a4c1e2cc9dfcb7ed691b79f3c6ab9") # tag: 0.4.1
md5sums=('SKIP')

build() {
  cd minitree
  python setup.py build
}

package() {
  cd minitree
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: github.com/xyproto/minitree
# vim: ts=2 sw=2 et:
