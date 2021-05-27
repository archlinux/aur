# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=autovdirsyncer
pkgver=0.1.0
pkgrel=1
pkgdesc="Wrapper to daemonise vdirsyncer"
arch=('x86_64' 'aarch64')
url="https://git.sr.ht/~whynothugo/autovdirsyncer"
license=('ISC')
depends=('vdirsyncer')
makedepends=('go')
source=("git+https://git.sr.ht/~whynothugo/autovdirsyncer?signed#tag=v${pkgver}")
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
