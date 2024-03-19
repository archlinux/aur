# Contributor: Simon Gomizelj <simongmzlj@gmail.com>

pkgname=envoy-git
pkgver=14.35.g50c069f
pkgrel=1
pkgdesc="A ssh-agent/gpg-agent keychain and process monitor"
arch=('i686' 'x86_64')
url="http://github.com/vodik/envoy"
license=('GPL-3.0-only')
depends=('openssh' 'systemd')
optdepends=('gnupg: gpg-agent support')
makedepends=('git' 'ragel')
conflicts=('envoy')
provides=('envoy')
source=('git+https://github.com/vodik/envoy.git')
sha1sums=('SKIP')

pkgver() {
  cd "envoy"
  git describe | sed 's/^v//;s/-/./g'
}

build() {
  make -C "envoy"
}

package() {
  make -C "envoy" DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
