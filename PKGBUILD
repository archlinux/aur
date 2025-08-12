# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=nodejs-jsonschema2md
pkgver=8.0.5 # renovate: datasource=github-releases depName=adobe/jsonschema2md
pkgrel=1
pkgdesc="Convert Complex JSON Schemas into Markdown Documentation"
url="https://github.com/adobe/jsonschema2md"
license=('Apache-2.0')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=("${source[0]##*/}")
depends=("nodejs")
makedepends=("npm")
arch=('x86_64')
sha512sums=('42f8fcbf669874adc48315645f606357d4cd72846759c0a9926802e37577f3e4b7585fd9c940c4208a336a59177c03647cabbf06b795af21b6c8f03ae93de4f1')
conflicts=("$pkgname" "${pkgname}-git")

package() {
  install -dm755 "$pkgdir/usr/lib/node_modules"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/${source[0]##*/}"
}

#vim: syntax=sh
