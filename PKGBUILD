# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=dfu-convert-git
pkgver=r3.17064d7
pkgrel=1
pkgdesc='Tool that converts RAW binary firmware into DFU format and back'
arch=(any)
url='https://github.com/plietar/dfuse-tool'
license=(unknown)
depends=(python2 python2-intelhex)
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
