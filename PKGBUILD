# Maintainer: Richard Steinmetz <steinmetz.richard@googlemail.com>

pkgname=taskbook
pkgver=0.3.0
pkgrel=1
pkgdesc='Tasks, boards & notes for the command-line habitat'
arch=(any)
url=https://github.com/klaussinani/taskbook
license=(MIT)
depends=(nodejs)
makedepends=(npm)
conflicts=(taskbook-git)
source=($url/archive/v$pkgver.tar.gz)
sha256sums=(931745b06239dc2e7f70b440a869a01e07e124853b56377384364826b663f5fd)

build() {
  cd taskbook-$pkgver
  npm install
}

package() {
  install -d "$pkgdir"/usr/{lib/node_modules,bin}
  cp -a taskbook-$pkgver "$pkgdir"/usr/lib/node_modules/taskbook
  chmod +x "$pkgdir"/usr/lib/node_modules/taskbook/cli.js
  ln -s /usr/lib/node_modules/taskbook/cli.js "$pkgdir"/usr/bin/taskbook
  install -Dm 644 taskbook-$pkgver/license.md "$pkgdir"/usr/share/licenses/taskbook/LICENSE
}
