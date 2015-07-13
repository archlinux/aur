# Maintainer: Toke Høiland-Jørgensen <toke at toke dot dk>

pkgname=sqm-scripts-git
pkgver=r17.64aa83c
pkgrel=1
pkgdesc='A set of scripts that does simple SQM configuration.'
arch=('any')
url='https://github.com/tohojo/sqm-scripts'
license=('GPL')
depends=('iproute2')
makedepends=('git')
source=("sqm-scripts-git::git+https://github.com/tohojo/sqm-scripts.git")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="$pkgdir" install
}
