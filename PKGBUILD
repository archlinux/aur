# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=astrojs-ts-plugin
_pkgname=${pkgname#astrojs-}
pkgver=1.10.10
pkgrel=1
pkgdesc="TypeScript plugin adding support for .astro imports in .ts files"
url="https://github.com/withastro/astro/tree/main/packages/language-tools/ts-plugin#readme"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/@astrojs/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('14a4d08d0634ca1c24f4e08706e950f0214f0dcfb57f2473c3058584d46334c5')

prepare() {
  tar xf "${_pkgname}-${pkgver}.tgz"
}

package() {
  npm install --global --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"
  chown -R root:root "${pkgdir}"
}
