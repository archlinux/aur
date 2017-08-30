# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Great Contributor: Bartek Piotrowski <barthalion@gmail.com>
pkgname=pytomtom
pkgver=0.5.1
pkgrel=3
pkgdesc="Manage your TomTom under Linux"
arch=('any')
url="http://pytomtom.tuxfamily.org/"
license=('GPL')
depends=('python2' 'pygtk' 'cabextract')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/pytomtom/${pkgname}-${pkgver}.tar.gz")
sha256sums=('04087b796f8683807b00da0f5b9f3b721703f6a504de714003500bc720e22743')

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
