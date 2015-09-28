# Maintainer: douedd <oytdbm@gmail>
pkgname='coinversion-git'
pkgver=1
pkgrel=1
pkgdesc='prints any given bitcoin value in an array of currencies and denominations -- and vice versa.'
url='https://github.com/douedd/coinversion'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('git')
source=('git://github.com/douedd/coinversion.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  echo $(git rev-list --count master)
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 "${srcdir}/coinversion/coinversion.py" "${pkgdir}/usr/bin/coinversion"
}
