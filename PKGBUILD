# Maintainer: Thor77 <thor77 at thor77 dot org>
pkgname='wash'
pkgver='0.20.3'
pkgrel='1'
pkgdesc='A cloud-native shell for bringing remote infrastructure to your terminal'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://puppetlabs.github.io/wash/'
license=('Apache')
makedepends=('go' 'git')
source=("https://github.com/puppetlabs/wash/archive/${pkgver}.tar.gz")
sha256sums=('6466f8d1c93ee0aff6bdde042f2e1bf23f7bbca8eff5612a8ad8e668ad1f61bc')

build() {
  cd "$pkgname-$pkgver"
  go build .
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m755 wash "${pkgdir}/usr/bin/wash"
}
