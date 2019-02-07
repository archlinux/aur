# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=volatile-git
pkgver=0.28.d4e0090
pkgrel=1
pkgdesc="Simple ALSA status icon and volume control"
url="https://github.com/gavinhungry/volatile"
license=('MIT')
arch=('any')
makedepends=('git')
depends=('pygtk' 'python2-pyalsaaudio')
source=("${pkgname}::git+${url}.git#branch=master")
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
