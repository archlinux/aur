# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=acme.sh-git
pkgver=0.1734.8aff2bd
pkgrel=6
pkgdesc='An ACME Shell script, an acme client alternative to certbot'
arch=('any')
url='https://github.com/Neilpang/acme.sh'
license=('GPL3')
makedepends=('git')
source=("${pkgname}::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  install -Dm755 "${srcdir}/${pkgname}"/acme.sh "${pkgdir}"/usr/bin/acme.sh
}
