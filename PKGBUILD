# Maintainer:  Gonçalo Pereira <goncalo_pereira@outlook.pt>

pkgname=openpnp-git
pkgver=r3506.693671c629
pkgrel=1
pkgdesc="Open Source SMT Pick and Place Hardware and Software"
arch=('arm64' 'x86_64')
url='https://openpnp.org/'
license=('GPL3')
makedepends=('git' 'maven')
source=("${pkgname}::git+https://github.com/openpnp/openpnp.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  mvn package
}

package() {
  cd "${srcdir}/${pkgname}"
}
