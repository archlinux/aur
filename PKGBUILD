# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Great Contributor: Bartek Piotrowski <barthalion@gmail.com>
pkgname=pytomtom
pkgver=0.5.1
pkgrel=2
pkgdesc="Manage your TomTom under Linux"
arch=('any')
url="http://pytomtom.tuxfamily.org/"
license=('GPL')
depends=('python2' 'pygtk' 'cabextract')
source=(https://pytomtom.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('4cd3a01c2b020578c8894bd556cef339')

build() {
  cd "${srcdir}/${pkgname}"
  sed -i -e 's/python/python2/' bin/pytomtom
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 755 bin/pytomtom "${pkgdir}/usr/bin/pytomtom"
  chmod -R 755 share # I've no idea how to make it better, but it works.
  cp -dpr --no-preserve=ownership share "${pkgdir}/usr"
}
