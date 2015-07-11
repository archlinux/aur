# Maintainer: Anatol Pomozov 

pkgname=creator-build-git
pkgver=r123.f42170c
pkgrel=1
pkgdesc='Meta Build System for Ninja tool'
arch=(any)
url='https://github.com/creator-build/creator'
license=(MIT)
depends=(python python-nr.strex)
source=(git+https://github.com/creator-build/creator)
sha1sums=('SKIP')

pkgver() {
  cd creator
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd creator
  python setup.py install --root="$pkgdir" --optimize=1
}
