# Maintainer: Thor77 <thor77 at thor77 dot org>
pkgname='wash'
pkgver='0.19.1'
pkgrel='1'
pkgdesc='A cloud-native shell for bringing remote infrastructure to your terminal'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://puppetlabs.github.io/wash/'
license=('Apache')
makedepends=('go' 'git')
source=("https://github.com/puppetlabs/wash/archive/${pkgver}.tar.gz")
sha256sums=('f3490d2ea4e06a02a7a376991572f76dafa0ca0c174512319dedf5bcc0eff070')

build() {
  cd "$pkgname-$pkgver"
  go build .
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m755 wash "${pkgdir}/usr/bin/wash"
}
