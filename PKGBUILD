# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=taskbook
pkgver=0.1.1
pkgrel=1
pkgdesc='Tasks, boards & notes for the command-line habitat'
arch=(any)
url=https://github.com/klauscfhq/taskbook
license=(MIT)
depends=(nodejs)
makedepends=(npm)
conflicts=(taskbook-git)
source=($url/archive/v$pkgver.tar.gz)
sha512sums=(5390f75890167ed18adcbab8af7763411ff7e66393b476928e24b0ae987dd2bde2e4ac68b69487b287d1f21abcc05fc22507156b91e4b03c2cbee0dbfbcadfb1)

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
