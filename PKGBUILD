# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=me_cleaner-git
pkgver=1.2.r4.g43612a6
pkgrel=2
pkgdesc='Tool for partial deblobbing of Intel ME/TXE firmware images'
arch=('any')
url='https://github.com/corna/me_cleaner'
license=('GPL3')
makedepends=('git')
source=("${pkgname}::git+${url}#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 me_cleaner.py "${pkgdir}"/usr/bin/me_cleaner
}
