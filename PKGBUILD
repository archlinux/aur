# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=systemd-lock-handler
pkgver=2.3.0
pkgrel=1
pkgdesc="Logind lock event to systemd target translation."
arch=('any')
url="https://git.sr.ht/~whynothugo/systemd-lock-handler"
license=('ISC')
makedepends=('go' 'git')
source=("git+https://git.sr.ht/~whynothugo/systemd-lock-handler?signed#tag=v${pkgver}")
md5sums=('SKIP')
validpgpkeys=('13FF264E91839686966CA2AC388ADF1E2EEA7F1A')

build() {
  cd "$srcdir/$pkgname"

  make build
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}
