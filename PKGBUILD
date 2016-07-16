# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=mkosi-git
pkgver=r44.96e64b4
pkgrel=1
pkgdesc="Build Legacy-Free OS Images"
arch=('any')
url="https://github.com/systemd/mkosi"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
provides=('mkosi')
conflicts=('mkosi')
source=("git://github.com/systemd/mkosi.git")
md5sums=('SKIP')

pkgver() {
  cd "mkosi"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "mkosi"

  python setup.py install --root="$pkgdir"
}

