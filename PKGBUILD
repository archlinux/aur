# Maintainer: Brian Cooper <brian@omni.dev>

_npmname="@omnidev/knit"
_pkgname="knit"
pkgname="nodejs-knit"
pkgver="0.1.2"
pkgrel="1"
pkgdesc="🧶 Knit local dependencies together"
url="https://github.com/coopbri/knit"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/${_npmname}/-/${_pkgname}-${pkgver}.tgz")
b2sums=('a0ba793b45c0c425380999892c438d2dbea1f94ba02cf3cc99a0d50ceab7eedd42b7608c9a723d65993c7aa887a5b79411a7f7fdbbf3b8cb1bd142cb6267511c')

prepare() {
    tar xf "${_pkgname}-${pkgver}.tgz" package/LICENSE.md
}

package() {
    npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"
    install -Dm644 package/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
