# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
pkgname=slidev-cli
pkgver=52.11.1
pkgrel=1
pkgdesc='Presentation Slides for Developers'
arch=(any)
url=https://sli.dev
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/@slidev/cli/-/cli-$pkgver.tgz)
sha512sums=('cc3ca6b8050d7159878bf97d83ba51f1f10ff26a8aaa6c6958a9d29a22d473096e9eb04d19cab3e897296cc89222c67305dfd85b9aff93f00eb199ea23985641')

package() {
  npm i -g --prefix "$pkgdir/usr" "cli-$pkgver.tgz"

  cd "$pkgdir/usr"

  find . -exec chown -h 0:0 {} +
  find . -type d -exec chmod 755 {} +

  install -Dm644 lib/node_modules/@slidev/cli/LICENSE -t "share/licenses/$pkgname"
}
