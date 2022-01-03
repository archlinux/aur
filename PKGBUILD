# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=dfu-convert-git
pkgver=r8.e2b1c1c
pkgrel=1
pkgdesc='Tool that converts RAW binary firmware into DFU format and back'
arch=(any)
url='https://github.com/dsavinkin/dfuse-tool'
license=(unknown)
depends=(python python-intelhex)
makedepends=(git)
source=(git://github.com/plietar/dfuse-tool)
sha512sums=('SKIP')

pkgver() {
  cd dfuse-tool
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd dfuse-tool
  install -D -m755 dfu-convert "$pkgdir"/usr/bin/dfu-convert
}
