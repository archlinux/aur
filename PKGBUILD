# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor:

pkgname=calm-git
pkgver=r335.abb1c0d
pkgrel=1
pkgdesc='Cygwin package server toolkit'
arch=('any')
url='https://cygwin.com/package-server.html'
license=('custom:MIT')
depends=('python')
makedepends=('python')

source=(
  "${pkgname}::git+https://sourceware.org/git/cygwin-apps/calm.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${pkgname}" rev-list --count HEAD)" \
    "$(git -C "${pkgname}" rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
