# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Mauro Andreolini <mauro.andreolini@unimore.it>

pkgname=hash-identifier
pkgver=1.1
pkgrel=4
_githash=70f3da48079607bd5d106c4b9767fe4abf14150e
pkgdesc='Identify the different types of hashes used to encrypt data and especially passwords'
url='https://github.com/Miserlou/Hash-Identifier'
arch=('any')
license=('GPL3')
depends=('python2')
source=(https://raw.githubusercontent.com/Miserlou/Hash-Identifier/${_githash}/Hash_ID.py)
sha512sums=('af889ebd84d2bd73c9a9623b5573bbb8a4cf5d3ffa6de75b272644905c4c1fa7e5bfcfb24d5ac75ffd73e4305447dd357f16b6248a16424094fc8b8cffca378d')

prepare() {
  sed -e "s|env python|env python2|" -i Hash_ID.py
  sed -e 's|\r||g' -i Hash_ID.py
}

package() {
  install -Dm 755 Hash_ID.py "${pkgdir}/usr/bin/hash-identifier"
}

# vim: ts=2 sw=2 et:
