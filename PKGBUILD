# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=acme.sh-git
pkgver=0.1194.a0037c9
pkgrel=1
pkgdesc="An ACME Shell script, an acme client alternative to certbot"
arch=('any')
url="https://github.com/Neilpang/acme.sh"
license=('GPL3')
makedepends=('git')
source=("${pkgname}::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -m 755 "${srcdir}/${pkgname}/acme.sh" "${pkgdir}/usr/bin/"
}
