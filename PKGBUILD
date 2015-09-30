# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=nodejs-jscs
pkgver=2.2.0
pkgrel=1
pkgdesc='JavaScript Code Style'
arch=('any')
url='http://jscs.info/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)

package() {
  npm install --user root -g --prefix="${pkgdir}"/usr jscs@${pkgver}

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../../../usr/lib/node_modules/jscs/LICENSE \
     "${pkgdir}/usr/share/licenses/${pkgname}"

  find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \;
}
