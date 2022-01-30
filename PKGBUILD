# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=malc
pkgver=0.1.0
_commit=e1e54e9999de38a3197682b473f728b1598ebd29
pkgrel=1
pkgdesc="Change a MacBooks' keyboard backlight level based on current ambient light."
arch=("x86_64")
url="https://gitlab.com/WhyNotHugo/malc/"
license=('ISC')
depends=('rust')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/WhyNotHugo/$pkgname/repository/archive.tar.gz?ref=v$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-v$pkgver-$_commit"

  make
}

package() {
  cd "$srcdir/$pkgname-v$pkgver-$_commit"

  make DESTDIR="$pkgdir/" PREFIX=/usr/ install
}
