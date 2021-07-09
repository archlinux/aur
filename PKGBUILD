# Maintainer: André Kugland <kugland at gmail dot com>

pkgname=create-next-app
pkgver=11.0.1
pkgrel=1
pkgdesc='Create Next.js-powered React apps with one command.'
arch=(any)
url='https://www.npmjs.com/package/create-next-app'
license=('MIT')
source=(
  "https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
  'create-next-app'
)
sha256sums=(
  'b8cc850ed3bfaa5d0b6f22cebe755bac50bf6a1e2fa6052844c58eae3db217d4'
  'SKIP'
)

package() {
  cd "$srcdir"
  install -o0 -g0 -m755 ../create-next-app -D -t "$pkgdir/usr/bin"

  cd "$srcdir/package"
  mkdir -p "$pkgdir/usr/share/create-next-app"
  cp -r dist/* "$pkgdir/usr/share/create-next-app/"
  chown -R root:root "$pkgdir/usr/share/create-next-app/"
  install -o0 -g0 -m644 license.md -D -t "$pkgdir/usr/share/doc/create-next-app"
  install -o0 -g0 -m644 README.md -D -t "$pkgdir/usr/share/doc/create-next-app"
}
