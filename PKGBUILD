# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=astrojs-ts-plugin
_pkgname=${pkgname#astrojs-}
pkgver=1.10.1
pkgrel=1
pkgdesc="TypeScript plugin adding support for .astro imports in .ts files"
url="https://github.com/withastro/language-tools/tree/main/packages/ts-plugin#readme"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/@astrojs/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('9a8bc61aad2878aa0f3259c3f36d98622f49c71d3406d61ec5b75193cb0bd91b')

prepare() {
  tar xf "${_pkgname}-${pkgver}.tgz"
}

package() {
  npm install --global --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"
  chown -R root:root "${pkgdir}"
}
