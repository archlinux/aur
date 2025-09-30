# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=nodejs-jsonschema2md
pkgver=8.0.6 # renovate: datasource=github-releases depName=adobe/jsonschema2md
pkgrel=1
pkgdesc="Convert Complex JSON Schemas into Markdown Documentation"
url="https://github.com/adobe/jsonschema2md"
license=('Apache-2.0')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=("${source[0]##*/}")
depends=("nodejs")
makedepends=("npm")
arch=('x86_64')
sha512sums=('7483795c11d5641330bb564737c0f365cf71c3b2c7209fd9b33ecb0a957f07927a47f2c444ccdcc0bfd7db75abf379c90e3fa07b462aceb6e4e0dffc9332cdad')
conflicts=("$pkgname" "${pkgname}-git")

package() {
  install -dm755 "$pkgdir/usr/lib/node_modules"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/${source[0]##*/}"
}

#vim: syntax=sh
