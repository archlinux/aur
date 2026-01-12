# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
pkgname=slidev-cli
pkgver=52.11.2
pkgrel=1
pkgdesc='Presentation Slides for Developers'
arch=(any)
url=https://sli.dev
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/@slidev/cli/-/cli-$pkgver.tgz)
sha512sums=('7d8aeaea3ef00974223ff68b9a773af8986d85c7fb39336159915b10fc6bc5fd7b1a387f7255bd18261979ace517da3998d035aa99aea8200480c31884a33c89')

package() {
  npm i -g --prefix "$pkgdir/usr" "cli-$pkgver.tgz"

  cd "$pkgdir/usr"

  find . -exec chown -h 0:0 {} +
  find . -type d -exec chmod 755 {} +

  install -Dm644 lib/node_modules/@slidev/cli/LICENSE -t "share/licenses/$pkgname"
}
