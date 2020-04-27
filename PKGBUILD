# Maintainer: Thor77 <thor77 at thor77 dot org>
pkgname='wash'
pkgver='0.23.0'
pkgrel='1'
pkgdesc='A cloud-native shell for bringing remote infrastructure to your terminal'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://puppetlabs.github.io/wash/'
license=('Apache')
makedepends=('go' 'git')
source=("https://github.com/puppetlabs/wash/archive/${pkgver}.tar.gz")
sha256sums=('3b7462c7b4aa3163f9b79f2892495ec66c52ec29d6c5c91aa25d3d31c0e1e535')

build() {
  cd "$pkgname-$pkgver"
  go build .
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m755 wash "${pkgdir}/usr/bin/wash"
}
