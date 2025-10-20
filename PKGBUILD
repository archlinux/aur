# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=nodejs-jsonschema2md
pkgver=8.0.7 # renovate: datasource=github-releases depName=adobe/jsonschema2md
pkgrel=1
pkgdesc="Convert Complex JSON Schemas into Markdown Documentation"
url="https://github.com/adobe/jsonschema2md"
license=('Apache-2.0')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=("${source[0]##*/}")
depends=("nodejs")
makedepends=("npm")
arch=('x86_64')
sha512sums=('9fa4aa41a8d45c07a4419a87859210c7f4d450c0a6575b7d36c1e5ebeb2f6b709b6267948a42bdd50efdc706c53463ef2846598728b3f959c58a00609b64d9bf')
conflicts=("$pkgname" "${pkgname}-git")

package() {
  install -dm755 "$pkgdir/usr/lib/node_modules"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/${source[0]##*/}"
}

#vim: syntax=sh
