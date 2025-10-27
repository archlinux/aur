# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=volatile-git
pkgver=0.53.8b53d06
pkgrel=1
pkgdesc="ALSA status icon and volume control"
arch=('any')
url="https://github.com/gavinhungry/volatile"
license=('MIT')
depends=('python-pyalsaaudio')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${pkgname}
  echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}"/${pkgname}
  mkdir -p "${pkgdir}"/usr/bin

  install -m 755 volatile.py "${pkgdir}"/usr/bin/volatile
}
