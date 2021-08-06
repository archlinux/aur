# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=systemd-lock-handler
pkgver=2.0.0
pkgrel=2
pkgdesc="Logind lock event to systemd target translation."
arch=('any')
url="https://git.sr.ht/~whynothugo/systemd-lock-handler"
license=('ISC')
makedepends=('go' 'git')
source=("git+https://git.sr.ht/~whynothugo/systemd-lock-handler?signed#tag=v${pkgver}")
md5sums=('SKIP')
validpgpkeys=('951082781CA308E4A529DEFD6F9FFF122B98C0CD')

build() {
  cd "$srcdir/$pkgname"

  make build
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}
