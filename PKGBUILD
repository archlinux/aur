# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=libkcoidc
pkgver=0.9.2
pkgrel=1
pkgdesc='Kopano OpenID Connection validation library'
url="https://stash.kopano.io/projects/KC/repos/libkcoidc"
makedepends=(go git)
arch=(x86_64)
license=('AGPL')
source=(git+https://stash.kopano.io/scm/kc/libkcoidc.git#tag=v${pkgver}?signed)
validpgpkeys=('9DDB6CAD455D63112CAD26D8CA499C410B3C3354')
sha512sums=('SKIP')

prepare() {
  cd libkcoidc
  ./bootstrap.sh
}

build() {
  cd libkcoidc
  ./configure --prefix=/usr
  make LDFLAGS=""
}

package() {
  cd libkcoidc
  make install LDFLAGS="" DESTDIR=$pkgdir
}
