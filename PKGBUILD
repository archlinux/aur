# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=astrojs-ts-plugin
_pkgname=${pkgname#astrojs-}
pkgver=1.7.0
pkgrel=1
pkgdesc="TypeScript plugin adding support for .astro imports in .ts files"
url="https://github.com/withastro/language-tools/tree/main/packages/ts-plugin#readme"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/@astrojs/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('0b75a33a1e488c2d4d0c8262d22f7952f7835f3713b54f61de92e6c65fe4ab3e')

prepare() {
  tar xf "${_pkgname}-${pkgver}.tgz"
}

package() {
  npm install --global --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"
  chown -R root:root "${pkgdir}"
}
