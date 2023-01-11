# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=metamovie-git
pkgver=r5.b50704c
pkgrel=4
pkgdesc="Fetch git-annex metadata from IMDB"
arch=('any')
depends=('git-annex' 'python-imdbpy')
url="https://github.com/pigmonkey/metamovie"
license=('GPL')
makedepends=('git')
provides=('metamovie')
conflicts=('metamovie')
source=('git+https://github.com/pigmonkey/metamovie.git')
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/metamovie"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/metamovie"
  install -D -m0755 ${srcdir}/metamovie/metamovie ${pkgdir}/usr/bin/metamovie
}
