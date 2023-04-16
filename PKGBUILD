# Contributor: Konstantinos Foutzopoulos <mail@konfou.xyz>
# Contributor: asuka minato

pkgname=arcpp
pkgver=0.21
pkgrel=1
pkgdesc="An implementation of the Arc programming language."
arch=('x86_64' 'i686')
url="https://github.com/kimtg/Arcpp"
license=('Apache')
depends=('readline')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/kimtg/${pkgname}/archive/v${pkgver}.zip")
sha256sums=('666f253d01264dbe6d8b3a2c6cff70b3399aee149d0e4ffe89e5ac089c18f89d')

build() {
  cd ${pkgname/a/A}-${pkgver}
  make readline
}

package() {
  cd ${pkgname/a/A}-${pkgver}
  install -Dm755 "arc++" "${pkgdir}/usr/bin/arc++"
}

# vim:set ts=2 sw=2 et:
