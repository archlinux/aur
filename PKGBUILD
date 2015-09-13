# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

pkgname=passed-git
pkgver=0.0.1
pkgrel=1
pkgdesc='A simple script to modify password store entries with sed commands'
arch=(any)
url='https://github.com/jreinert/passed'
licence=('MIT')
depends=(ruby pass)

source=("${pkgname}::git+https://github.com/jreinert/passed.git")
sha512sums=(SKIP)
provides=('passed')

pkgver() {
  cd "${pkgname}"
  git describe --tags | sed 's/^v//;s/-/./g'
}

package() {
  cd "${pkgname}"
  install -d "$pkgdir/usr/bin"
  install -m755 passed "$pkgdir/usr/bin/passed"
}

# vim:set ts=2 sw=2 et:
