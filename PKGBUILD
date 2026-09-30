# Maintainer: Denis Kasak <dkasak AT termina.org.uk>

pkgname=english-wordnet
pkgdesc="A fork of the Princeton Wordnet developed under an open source methodology."
pkgver=2025
pkgrel=2
arch=('any')
conflicts=(wordnet-common)
provides=(wordnet-common)
url="https://en-word.net/"
license=("custom")
source=("https://en-word.net/static/english-wordnet-${pkgver}.zip"
        "https://raw.githubusercontent.com/globalwordnet/english-wordnet/master/LICENSE.md")
sha256sums=('38b16326159f51853626b7d24a44c453fa88ab33f06fce5ec8fc5996d1c2be93'
            '5d02a553699c4841d8b33cc5a1313cff1f96264e36e9dc98be829dfc94a6cc73')

package() {
  install -d -m755 "${pkgdir}/usr/share/wordnet"
  install -m644 "${srcdir}"/oewn${pkgver}/* "${pkgdir}/usr/share/wordnet"

  # Support programs expecting old data location
  ln -s /usr/share/wordnet "${pkgdir}/usr/share/wordnet/dict"

  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
