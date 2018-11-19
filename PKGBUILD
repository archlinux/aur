# Maintainer: Richard Steinmetz <steinmetz.richard@googlemail.com>

pkgname=taskbook
pkgver=0.2.0
pkgrel=1
pkgdesc='Tasks, boards & notes for the command-line habitat'
arch=(any)
url=https://github.com/klaussinani/taskbook
license=(MIT)
depends=(nodejs)
makedepends=(npm)
conflicts=(taskbook-git)
source=($url/archive/v$pkgver.tar.gz)
sha256sums=(c8abca6edf1284d0e374ce5e3abec5cb110a472d274c71d3de4ced58022ab893)

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
