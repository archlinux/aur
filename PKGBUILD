# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
pkgname=slidev-cli
pkgver=53.2.0
pkgrel=1
pkgdesc='Presentation Slides for Developers'
arch=(any)
url=https://sli.dev
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/@slidev/cli/-/cli-$pkgver.tgz)
sha512sums=('3fda5305127be4d7cae1743a81a85813eb7b424cbd37dd31de8602a099afef0cfbcecbf3c4673afde023d78ef8e700fe5def73b1e2f0871d91ac61c1c861ea25')

package() {
  npm i -g --prefix "$pkgdir/usr" "cli-$pkgver.tgz"

  cd "$pkgdir/usr"

  find . -exec chown -h 0:0 {} +
  find . -type d -exec chmod 755 {} +

  install -Dm644 lib/node_modules/@slidev/cli/LICENSE -t "share/licenses/$pkgname"
}
