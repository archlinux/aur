# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=redoc-cli
pkgver=0.10.4
pkgrel=1
pkgdesc="ReDoc's Command Line Interface"
arch=('any')
url="https://github.com/Redocly/redoc"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(
  "https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
)
sha256sums=(
  'b0baae4b1d21d4a46cfea5e69b4e9c72bcda9da89b6c428fad6747f57dd0b8c1'
)
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  chmod -R go-w "${pkgdir}/usr"
  # Why there is always a weird package `/usr/lib/node_modules/root/` while installing some packages from npm?
  rm -rf "${pkgdir}/usr/lib/node_modules/root/"
}

# vim:set ts=2 sw=2 et:
