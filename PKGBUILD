# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=astrojs-ts-plugin
_pkgname=${pkgname#astrojs-}
pkgver=1.10.2
pkgrel=1
pkgdesc="TypeScript plugin adding support for .astro imports in .ts files"
url="https://github.com/withastro/language-tools/tree/main/packages/ts-plugin#readme"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/@astrojs/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('661c9b3974b6d2a8b2db8674cbaa4a30f87fe499dc1a44002eefe28ec9b2f7e5')

prepare() {
  tar xf "${_pkgname}-${pkgver}.tgz"
}

package() {
  npm install --global --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"
  chown -R root:root "${pkgdir}"
}
