# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=autovdirsyncer
pkgver=0.2.1
pkgrel=1
pkgdesc="Wrapper to daemonise vdirsyncer"
arch=('x86_64' 'aarch64')
url="https://git.sr.ht/~whynothugo/autovdirsyncer"
license=('ISC')
depends=('vdirsyncer')
makedepends=('go' 'git' 'scdoc')
source=("git+https://git.sr.ht/~whynothugo/autovdirsyncer?signed#tag=v${pkgver}")
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
