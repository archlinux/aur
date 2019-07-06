# Maintainer: Sam Stuewe <halosghost at archlinux dot info>

pkgname=uacme
pkgver=v1.0.17
pkgrel=1
pkgdesc='An ACMEv2 client written in plain C code with minimal dependencies'
arch=('i686' 'x86_64')
url='https://github.com/ndilieto/uacme/'
makedepends=('asciidoc')
depends=('curl' 'gnutls')
license=('GPL')
source=("https://github.com/ndilieto/$pkgname/archive/$pkgver.tar.gz")
md5sums=('41bbf128aff602a0b59d67c1e405eece') # not upstream

build() {
  cd "$pkgname-${pkgver//v/}"

  make
}

prepare() {
  cd "$pkgname-${pkgver//v/}"

  ./configure
}

package() {
  cd "$pkgname-${pkgver//v/}"

  make DESTDIR="$pkgdir" PREFIX='/usr' install
}

# vim:set ts=2 sw=2 et:
