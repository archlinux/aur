# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mklicense
_npmname=mklicense
pkgver=0.3.3
pkgrel=1
pkgdesc="Generate license files from the command line"
arch=('any')
url="https://github.com/cezaraugusto/mklicense"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/mklicense-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('a5f67b3870f412d52341a0598aa018d066637bb4bb7689d51d20e0dbc21da6ec')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
