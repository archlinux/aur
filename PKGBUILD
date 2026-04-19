# Maintainer: Lucas Rooyakkers <lucas.rooyakkers@pm.me>

pkgname=remodex
pkgver=1.3.8
pkgrel=1
pkgdesc="Local bridge between Codex and the Remodex mobile app"
arch=('any')
url="https://www.npmjs.com/package/remodex"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tgz")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('5513482fb4d3573fa94386471dc9d29ae04b5bcaa8b7ba09a277ed8c02115139')

package() {
  local npm_cache="${srcdir}/npm-cache"

  export HOME="${srcdir}"

  npm install -g \
    --cache "${npm_cache}" \
    --prefix "${pkgdir}/usr" \
    --ignore-scripts \
    --no-audit \
    --no-fund \
    --omit=dev \
    "${srcdir}/${pkgname}-${pkgver}.tgz"
}
