# Maintainer: Denis Kasak <dkasak AT termina.org.uk>

pkgname=english-wordnet
pkgdesc="A fork of the Princeton Wordnet developed under an open source methodology."
pkgver=2020
pkgrel=2
arch=('i686' 'x86_64')
conflicts=(wordnet-common)
provides=(wordnet-common)
url="https://en-word.net/"
license=("custom")
source=("https://en-word.net/static/english-wordnet-${pkgver}.zip"
        "https://raw.githubusercontent.com/globalwordnet/english-wordnet/master/LICENSE.md")
sha256sums=('d7abeec8bc351122337bd8c1126a3fd6f03ac88fc7f68c7adae9e31e3be7e66b'
            'e7b867b3c3e8910315b3386cb0e17d4b57b2bc9f251213deeb02571a7ac2610a')

package() {
  install -d -m755 "${pkgdir}/usr/share/wordnet/dict"
  install -m644 "${srcdir}"/* "${pkgdir}/usr/share/wordnet/dict"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
