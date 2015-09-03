# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

pkgname=hless-git
pkgver=0.1.0.2.g3eb19fa
pkgrel=1
pkgdesc='less with syntax highlighting'
arch=(any)
url='https://github.com/jreinert/hless'
licence=('MIT')
depends=(python2-pygments)
makedepends=(crystal-git)

source=("${pkgname}::git+https://github.com/jreinert/hless.git")
sha512sums=(SKIP)
provides=('hless')
conflicts=('hless-bin')

pkgver() {
  cd "${pkgname}"
  git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  install -d "$pkgdir/usr/bin"
  install -m755 hless "$pkgdir/usr/bin/hless"
}

# vim:set ts=2 sw=2 et:
