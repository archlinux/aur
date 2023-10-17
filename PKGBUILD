pkgname=pino-pretty
pkgver=10.2.3
pkgrel=1
pkgdesc="A basic ndjson formatter for pino logging format"
arch=(any)
url="https://github.com/pinojs/pino-pretty"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('7739091d71814423ecabd5f52601380c1b4afe536289b3bdd8099e8a849405c2')

prepare() {
  tar -xvzf "$pkgname-$pkgver.tgz" --directory "${srcdir}" "package/LICENSE"
}

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/np-cache" "$pkgname@$pkgver"
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  chown -R root:root "$pkgdir"
}
