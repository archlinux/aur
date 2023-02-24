# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=systemd-lock-handler
pkgver=2.4.1
pkgrel=1
pkgdesc="Logind lock event to systemd target translation."
arch=('any')
url="https://git.sr.ht/~whynothugo/systemd-lock-handler"
license=('ISC')
makedepends=('go' 'git')
source=("git+https://git.sr.ht/~whynothugo/systemd-lock-handler?signed#tag=v${pkgver}")
md5sums=('SKIP')
validpgpkeys=('1204CA9FC2FFADEEDC2961367880733B9D062837')

build() {
  cd "$srcdir/$pkgname"

  make build
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}
