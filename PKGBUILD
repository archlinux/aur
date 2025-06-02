# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
pkgname=slidev-cli
pkgver=51.8.1
pkgrel=1
pkgdesc='Presentation Slides for Developers'
arch=(any)
url=https://sli.dev
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/@slidev/cli/-/cli-$pkgver.tgz)
sha512sums=('6583d56ea856cdf376243c9b62444ec7c72918740dbf2851bb883c6c2e5dff5e53f4e650b6fcd65d16813c2de48a7e8f41b2143038414a2428c981925fb01657')

package() {
  npm i -g --prefix "$pkgdir/usr" "cli-$pkgver.tgz"

  cd "$pkgdir/usr"

  find . -exec chown -h 0:0 {} +
  find . -type d -exec chmod 755 {} +

  install -Dm644 lib/node_modules/@slidev/cli/LICENSE -t "share/licenses/$pkgname"
}
