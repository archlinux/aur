# Maintainer: Andre Kugland <kugland@gmail.com>

pkgname=preact-cli
pkgver=3.0.0
pkgrel=1
pkgdesc='Your next Preact PWA starts in 30 seconds.'
arch=(any)
url=https://github.com/preactjs/preact-cli
license=(MIT)
depends=("nodejs>=11")
makedepends=(npm)
source=(
  https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz
  https://raw.githubusercontent.com/preactjs/preact-cli/master/LICENCE
)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('44edde7295776b5cc7ec7888a20364382b6c1ff37d4f33b0ab3e1194709945be'
            'df88246bd228fce9d1e476692e8ea2c3309101070652f9ad57fff8fb566e6790')

package() {
  npm i -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz
  install -Dm 644 LICENCE -T "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$pkgdir"/usr

  # Fix permissions
  find . -exec chown -h 0:0 {} +
  find . -type d -exec chmod 755 {} +
}
