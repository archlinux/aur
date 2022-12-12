# Maintainer: André Kugland <kugland at gmail dot com>

pkgname=create-next-app
pkgver=13.0.6
pkgrel=1
pkgdesc='Create Next.js-powered React apps with one command.'
arch=(any)
url='https://www.npmjs.com/package/create-next-app'
license=('MIT')
source=(
  "https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
  'create-next-app'
)
sha256sums=('7ccb1797e3c920b74a532a85bf65f51379377916c984bc8313b75a15c84df960'
            'a637eea071b07a18109a17a25ca71f133645b11911b3174a52be947013989a3a')

package() {
  cd "$srcdir"
  install -o0 -g0 -m755 ../create-next-app -D -t "$pkgdir/usr/bin"

  cd "$srcdir/package"
  mkdir -p "$pkgdir/usr/share/create-next-app"
  cp -r dist/* "$pkgdir/usr/share/create-next-app/"
  chown -R root:root "$pkgdir/usr/share/create-next-app/"
  install -o0 -g0 -m644 README.md -D -t "$pkgdir/usr/share/doc/create-next-app"
}
