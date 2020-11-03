# Maintainer: Illia Shestakov <illia@ishestakov.com>

pkgname=pass-genphrase
pkgver=0.3
pkgrel=1
pkgdesc='passphrase generator extension for pass'
arch=('any')
url='https://github.com/congma/pass-genphrase'
license=('GPL3')
depends=('pass' 'python')
source=(https://github.com/congma/pass-genphrase/archive/${pkgver}.tar.gz)
sha512sums=('e041816d6a33b8f82bc3ba627c8aa4e806be4ffc0bfa180219157f8c024d8de0c187815d2f3082c6754fab1899f0179b188789e61664b919e2459ed2680a70fb')

package() {
  cd "${srcdir}/pass-genphrase-$pkgver/"
  sed -i 's|\$EXTENSIONS|/usr/lib/password-store/extensions/|' genphrase.bash
  DESTDIR="${pkgdir}" make globalinstall
}

