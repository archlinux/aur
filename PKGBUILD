# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=toxic
pkgdesc='CLI Tox client'
license=('GPL3')
pkgver=0.6.1
pkgrel=1
depends=('desktop-file-utils'
         'freealut'
         'libnotify'
         'toxcore')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url=('http://tox.chat')
source=("https://github.com/Tox/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('eac982bc65779d283af40ae185e7830e93822b0ec1dabd03b2cbd58e58474be8')
install="$pkgname.install"

build() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
