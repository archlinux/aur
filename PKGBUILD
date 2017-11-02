# Maintainer: xgdgsc at gmail.com

pkgname=libeemd-git
_pkgname=libeemd
pkgver=117.4aaaea9
pkgrel=1
pkgdesc="a C library for performing the ensemble empirical mode decomposition"
arch=('i686' 'x86_64')
url="https://bitbucket.org/luukko/libeemd"
license=('GPL3')
# options=(!libtool)
depends=('gsl')
makedepends=('make' 'gcc')
source=("${_pkgname}::git+https://bitbucket.org/luukko/libeemd.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX="${pkgdir}/usr" install
  # install -D -m644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}

# vim:set ts=2 sw=2 et:
