# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
pkgname=slidev-cli
pkgver=51.6.0
pkgrel=1
pkgdesc='Presentation Slides for Developers'
arch=(any)
url=https://sli.dev
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/@slidev/cli/-/cli-$pkgver.tgz)
sha512sums=('da43b53b34af859280a67a1312aef6792668d03819694123d13426b6a8f7e60f1ed264029a5fe9824a5b43bf164b7f2c4c020063dd647f03bea903d7da210eff')

package() {
  npm i -g --prefix "$pkgdir/usr" "cli-$pkgver.tgz"

  cd "$pkgdir/usr"

  find . -exec chown -h 0:0 {} +
  find . -type d -exec chmod 755 {} +

  install -Dm644 lib/node_modules/@slidev/cli/LICENSE -t "share/licenses/$pkgname"
}
