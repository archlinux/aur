# Maintainer: Kevin Brodsky <corax26 'at' gmail 'dot' com>

pkgname=upload-gphotos
pkgver=3.1.0
pkgrel=2
pkgdesc='Upload photos to Google Photos (Unofficial)'
arch=('any')
url='https://github.com/3846masa/upload-gphotos'
license=('MIT')
depends=(nodejs)
makedepends=(npm)
optdepends=('google-chrome: either Chrome or Chromium is required'
            'chromium: either Chrome or Chromium is required')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('16858c046a2195a463c72998da489118')

build() {
  cd "${pkgname}-${pkgver}"
  npm install -g $pkgname --prefix="$srcdir/usr" --production
}

package() {
  cd "${pkgname}-${pkgver}"
  cp -r "${srcdir}/usr" "${pkgdir}"

  install -Dm644 "$srcdir/usr/lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

