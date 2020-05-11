# Maintainer: Denis Kasak <dkasak AT termina.org.uk>

pkgname=english-wordnet
pkgdesc="A fork of the Princeton Wordnet developed under an open source methodology."
pkgver=2019
pkgrel=2
arch=('i686' 'x86_64')
conflicts=(wordnet-common)
provides=(wordnet-common)
url="https://en-word.net/"
license=("custom")
source=("https://en-word.net/static/english-wordnet-${pkgver}.zip"
        "https://raw.githubusercontent.com/globalwordnet/english-wordnet/master/LICENSE.md")
sha256sums=('b299b0a179a8a64678af3740ee4a9ce176d61de84013fd84a644f664f92e3221'
            'e7b867b3c3e8910315b3386cb0e17d4b57b2bc9f251213deeb02571a7ac2610a')

package() {
  install -d -m 755 "${pkgdir}/usr/share/wordnet/dict"
  install "${srcdir}"/wndb/* "${pkgdir}/usr/share/wordnet/dict"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
