# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=nodejs-jsonschema2md
pkgver=8.0.2 # renovate: datasource=github-releases depName=adobe/jsonschema2md
pkgrel=1
pkgdesc="Convert Complex JSON Schemas into Markdown Documentation"
url="https://github.com/adobe/jsonschema2md"
license=('APACHE')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=("${source[0]##*/}")
depends=("nodejs")
makedepends=("npm")
arch=('x86_64')
sha512sums=('a274febaa4f164a5ae969b2fed9e040e6bc6c88f6bf11bb023c3a1bc6e9cfb2f37f63c4b444c9a80304661c14a7a2f68f33ed391d4a2da80a689788bd8ed17c8')
conflicts=("$pkgname" "${pkgname}-git")

package() {
  install -dm755 "$pkgdir/usr/lib/node_modules"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/${source[0]##*/}"
}

#vim: syntax=sh
