# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=kirc
pkgver=1.2.2
pkgrel=1
pkgdesc='KISS for IRC, an IRC client written in POSIX C99'
arch=('x86_64')
url="https://github.com/mcpcpc/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('git')

source=("$pkgname::git+$url.git#tag=$pkgver")
b2sums=('SKIP')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

