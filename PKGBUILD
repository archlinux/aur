# Maintainer: Simon Gomizelj <simongmzlj@gmail.com>

pkgname=envoy-git
pkgver=12
pkgver() {
  cd "envoy"
  git describe | sed 's/^v//;s/-/./g'
}
pkgrel=1
pkgdesc="A ssh-agent/gpg-agent keychain and process monitor"

arch=('i686' 'x86_64')
url="http://github.com/vodik/envoy"
license=('GPL')
depends=('openssh' 'systemd')
optdepends=('gnupg: gpg-agent support')
makedepends=('git' 'ragel')
conflicts=('envoy')
provides=('envoy')
source=('git+git://github.com/vodik/envoy.git')
sha1sums=('SKIP')

build() {
  make -C "envoy"
}

package() {
  make -C "envoy" DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
