# Maintainer: Sam Stuewe <halosghost at archlinux dot info>

pkgname=uacme
pkgver=v1.5
pkgrel=1
pkgdesc='An ACMEv2 client written in plain C code with minimal dependencies'
arch=('i686' 'x86_64')
url='https://github.com/ndilieto/uacme/'
makedepends=('asciidoc')
depends=('curl' 'gnutls')
license=('GPL')
source=("https://github.com/ndilieto/$pkgname/archive/$pkgver.tar.gz")
md5sums=('9db336be7340c16c5d1030ad449d30d7') # not upstream

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
