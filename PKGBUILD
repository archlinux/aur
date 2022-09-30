# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=nodejs-jsonschema2md
pkgver=7.1.1
pkgrel=0
pkgdesc="Convert Complex JSON Schemas into Markdown Documentation"
url="https://github.com/adobe/jsonschema2md"
license=('APACHE')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=("${source[0]##*/}")
depends=("nodejs")
makedepends=("npm")
arch=('x86_64')
sha512sums=('1340f298758ad79f8f1aa356417f8b37027018d20a9bbf2ca27522e991574336f08a88edbf9ccea9584a1f469e27d3b943c9e3d634e94d8cd34be4880faf0300')
conflicts=("$pkgname" "${pkgname}-git")

package() {
  install -dm755 "$pkgdir/usr/lib/node_modules"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/${source[0]##*/}"
}

#vim: syntax=sh
