# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Mauro Andreolini <mauro.andreolini@unimore.it>

pkgname=hash-identifier
pkgver=1.1
pkgrel=3
pkgdesc="Identify the different types of hashes used to encrypt data and especially passwords"
url="https://code.google.com/p/hash-identifier/"
arch=('any')
license=('GPL3')
depends=('python2')
source=(https://hash-identifier.googlecode.com/files/Hash_ID_v${pkgver}.py)
sha512sums=('af889ebd84d2bd73c9a9623b5573bbb8a4cf5d3ffa6de75b272644905c4c1fa7e5bfcfb24d5ac75ffd73e4305447dd357f16b6248a16424094fc8b8cffca378d')

prepare() {
  sed -e "s|env python|env python2|" -i Hash_ID_v${pkgver}.py
  sed -e 's|||g' -i Hash_ID_v${pkgver}.py
}

package() {
  install -Dm 755 Hash_ID_v${pkgver}.py "${pkgdir}/usr/bin/hash-id"
}

# vim:set ts=2 sw=2 et:
