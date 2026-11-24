# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=capcut-cli
_npmname=capcut-cli
pkgver=0.37.1
pkgrel=1
pkgdesc="Unofficial CLI for editing CapCut and JianYing projects"
arch=('any')
url="https://github.com/renezander030/capcut-cli"
license=('MIT')
depends=('nodejs')
optdepends=('python: helper scripts')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/capcut-cli-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('58fbe9113a385ced8e274049d8771521a18a9251553e2d37f4ad65ae5e6a6592')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
