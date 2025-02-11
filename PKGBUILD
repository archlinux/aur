# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=hashbrowns-git
pkgver=0.22.a250522
pkgrel=1
pkgdesc="Provides cryptographic hashes with a minimal UI"
arch=('any')
url="https://github.com/gavinhungry/hashbrowns"
license=('MIT')
depends=('python')
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

  install -m 755 hashbrowns.py "${pkgdir}"/usr/bin/hashbrowns
}
