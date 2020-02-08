# Maintainer: Thor77 <thor77 at thor77 dot org>
pkgname='wash'
pkgver='0.20.2'
pkgrel='1'
pkgdesc='A cloud-native shell for bringing remote infrastructure to your terminal'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://puppetlabs.github.io/wash/'
license=('Apache')
makedepends=('go' 'git')
source=("https://github.com/puppetlabs/wash/archive/${pkgver}.tar.gz")
sha256sums=('35e96360117aaee81023047267e374bbfb82ae0a8c9428a9b0e8dfce36ef5f89')

build() {
  cd "$pkgname-$pkgver"
  go build .
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m755 wash "${pkgdir}/usr/bin/wash"
}
