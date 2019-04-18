# Maintainer: Denis Kasak <dkasak AT termina.org.uk>

pkgname=english-wordnet
pkgdesc="A fork of the Princeton Wordnet developed under an open source methodology."
pkgver=2019
pkgrel=1
arch=('i686' 'x86_64')
# conflicts=(wordnet-common)
provides=(wordnet-common)
url="https://en-word.net/"
license=("custom")
source=("https://en-word.net/static/english-wordnet-${pkgver}.zip"
        "https://raw.githubusercontent.com/globalwordnet/english-wordnet/master/LICENSE.md")
sha256sums=('291953e88354dd02c2923f4ee358bb8fdb09201922f9f26f79d6af0c6d8c5fe1'
            '7b0d0710f8bf85777bc233a88802cf84c091a6226717ee71f6adde3b9af542c5')

package() {
  install -d -m 755 "${pkgdir}/usr/share/wordnet/dict"
  install "${srcdir}"/wndb/* "${pkgdir}/usr/share/wordnet/dict"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
