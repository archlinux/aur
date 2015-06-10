# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=talktoniall
pkgver=20121213
pkgrel=1
pkgdesc='Talk to Niall'
arch=('x86_64' 'i686')
url='https://github.com/xyproto/talktoniall'
license=('GPL2')
makedepends=('go' 'go-check' 'go-niall')
options=('!strip' '!emptydirs')
source=("$pkgname.tgz::https://github.com/xyproto/$pkgname/archive/master.tar.gz")
sha256sums=('aac754508c8592adc568ac65c605a78b2eb0c99e7434b2630240a2c3d164a3a8')

build() {
  cd "$srcdir/$pkgname-master"

  source /etc/profile.d/go.sh
  go build
}

package() {
  cd "$srcdir/$pkgname-master"

  install -Dm755 "$pkgname-master" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
