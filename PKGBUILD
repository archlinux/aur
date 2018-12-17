# Maintainer: Richard Steinmetz <steinmetz.richard@googlemail.com>

pkgname=docker-bashbrew
pkgver=0
pkgrel=1
pkgdesc='Canonical build tool for the official docker images'
arch=('x86_64')
url='https://github.com/docker-library/official-images'
license=('Apache')
depends=('docker>=1:10' 'git')
makedepends=('gb')
provides=('bashbrew')
conflicts=('bashbrew')
source=("git+$url")
sha256sums=(SKIP)

build() {
  cd "$srcdir/official-images/bashbrew/go"
  gb build
}

package() {
  cd "$srcdir"
  install -Dm755 official-images/bashbrew/go/bin/bashbrew "$pkgdir/usr/bin/bashbrew"
  install -Dm644 official-images/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
