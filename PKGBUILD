# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=nodejs-jsonschema2md
pkgver=8.0.4 # renovate: datasource=github-releases depName=adobe/jsonschema2md
pkgrel=1
pkgdesc="Convert Complex JSON Schemas into Markdown Documentation"
url="https://github.com/adobe/jsonschema2md"
license=('Apache-2.0')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=("${source[0]##*/}")
depends=("nodejs")
makedepends=("npm")
arch=('x86_64')
sha512sums=('10e479e833ce6f9ab3c45a2dbef1497591a3770a0d2766155a4bcaa4130eabb1f35312bc934099b82dc83c48b87ca0db695e6cc322ea5c8234249fdba40738ac')
conflicts=("$pkgname" "${pkgname}-git")

package() {
  install -dm755 "$pkgdir/usr/lib/node_modules"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/${source[0]##*/}"
}

#vim: syntax=sh
