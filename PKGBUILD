# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=astrojs-ts-plugin
_pkgname=${pkgname#astrojs-}
pkgver=1.8.0
pkgrel=1
pkgdesc="TypeScript plugin adding support for .astro imports in .ts files"
url="https://github.com/withastro/language-tools/tree/main/packages/ts-plugin#readme"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/@astrojs/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('35cada328657bd1defdc1b28121459051bd7bfe4c360d5065c014062555ef4ea')

prepare() {
  tar xf "${_pkgname}-${pkgver}.tgz"
}

package() {
  npm install --global --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"
  chown -R root:root "${pkgdir}"
}
