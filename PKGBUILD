pkgname=pino-pretty
pkgver=10.0.0
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
sha256sums=('7f766a922720ae2c8719ef0fa2a5c0fa0338d80fdd43a4f3238b63cf1f46ec5b')

prepare() {
  tar -xvzf "$pkgname-$pkgver.tgz" --directory "${srcdir}" "package/LICENSE"
}

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/np-cache" "$pkgname@$pkgver"
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  chown -R root:root "$pkgdir"
}
