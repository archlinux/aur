# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=nodejs-jscs
pkgver=2.1.1
pkgrel=1
pkgdesc='JavaScript Code Style'
arch=('any')
url='http://jscs.info/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)
source=("https://github.com/jscs-dev/node-jscs/archive/v${pkgver}.tar.gz")
sha256sums=('c8c3d5a2b8234c96c0854aa2aeabcd0b99a1a5589988355a37ba8c26e6414ff8')

package() {
  cd "${srcdir}/node-jscs-${pkgver}"

  npm install --user root -g --prefix="${pkgdir}"/usr

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../../../usr/lib/node_modules/jscs/LICENSE \
     "${pkgdir}/usr/share/licenses/${pkgname}"
}
