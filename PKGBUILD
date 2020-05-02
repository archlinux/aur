# Maintainer: Sam Stuewe <halosghost at archlinux dot info>

pkgname=uacme
pkgver=v1.2.4
pkgrel=1
pkgdesc='An ACMEv2 client written in plain C code with minimal dependencies'
arch=('i686' 'x86_64')
url='https://github.com/ndilieto/uacme/'
makedepends=('asciidoc')
depends=('curl' 'gnutls')
license=('GPL')
source=("https://github.com/ndilieto/$pkgname/archive/$pkgver.tar.gz")
md5sums=('dd08015f9835dc1154cbda025c412f6e') # not upstream

build() {
  cd "$pkgname-${pkgver//v/}"

  make
}

prepare() {
  cd "$pkgname-${pkgver//v/}"

  ./configure --prefix='/usr'
}

package() {
  cd "$pkgname-${pkgver//v/}"

  make DESTDIR="$pkgdir" PREFIX='/usr' install
}

# vim:set ts=2 sw=2 et:
