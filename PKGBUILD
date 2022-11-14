# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=volatile-git
pkgver=0.36.e669e8d
pkgrel=1
pkgdesc="Simple ALSA status icon and volume control"
url="https://github.com/gavinhungry/volatile"
license=('MIT')
arch=('any')
makedepends=('git')
depends=('python-pyalsaaudio')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p ${pkgdir}/usr/bin

  install -m 755 volatile.py ${pkgdir}/usr/bin/volatile
}
