# Maintainer: Thor77 <thor77 at thor77 dot org>
pkgname='wash'
pkgver='0.18.1'
pkgrel='1'
pkgdesc='A cloud-native shell for bringing remote infrastructure to your terminal'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://puppetlabs.github.io/wash/'
license=('Apache')
makedepends=('go' 'git')
source=("https://github.com/puppetlabs/wash/archive/${pkgver}.tar.gz")
sha256sums=('7ec1043ca6a2efa9a732e054de4549770359afa5cdcc47c04c815173af915af6')

build() {
  cd "$pkgname-$pkgver"
  go build .
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m755 wash "${pkgdir}/usr/bin/wash"
}
