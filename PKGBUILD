# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname="npm-semver"

pkgver=5.1.0
pkgrel=1

pkgdesc="The semantic version parser used by npm"
url="https://github.com/npm/node-semver"

arch=('any')
license=('custom:ISC')

depends=('nodejs')
makedepends=('npm' 'git')

source=("https://github.com/npm/node-semver/archive/v${pkgver}.tar.gz")
sha256sums=('91a0e5bbbfee06f2433a4638e2cc0f7d019c2c7eef2ddec17acafb7734f20ea9')

package() {
  npm install --no-registry -g --user root --prefix "$pkgdir"/usr "${srcdir}/v${pkgver}.tar.gz"
  rm -r "${pkgdir}/usr/etc"
  install -D -m644 "${srcdir}/node-semver-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
