# Maintainer: André Kugland <kugland at gmail dot com>

pkgname=yo
pkgver=4.3.1
pkgrel=1
pkgdesc="CLI tool for running Yeoman generators"
arch=('any')
url='http://yeoman.io'
license=('BSD')
depends=('nodejs')
makedepends=('npm')
options=(!strip)
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yeoman/yo/archive/v${pkgver}.tar.gz")
sha256sums=('343831eb75ccca0acab40450a910c92c909ea6d88442886beb6ea0e81c419176')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/yo/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
