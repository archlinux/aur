# Maintainer:  Gilwiljam <gillbilljam@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=retroforth
pkgver=2025.8
pkgrel=1
pkgdesc='A modern, pragmatic Forth'
arch=('x86_64')
url='https://retroforth.org/'
license=('ISC')
depends=('glibc' 'bash')
source=("$pkgname-$pkgver::https://retroforth.org/r/RETRO12-2025.8.tar.gz")
b2sums=('45e06c8dfdb5394bb63914faf57bb1273426cd772e036a88d05938856f96a64b803c92fab56db7d9ef84659b00716741ca6b3e8f0026868741af3184ef09d885')

build() {
  cd $srcdir/RETRO12*

  make
}

package() {
  cd $srcdir/RETRO12*

  PREFIX=/usr DESTDIR="$pkgdir" make install

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
