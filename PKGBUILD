# Maintainer: Kirill Gagarski <gagarski@kspt.icc.spbstu.ru>
pkgname=antlr3
_shortname=${pkgname:0:-1}
pkgver=3.5.2
pkgrel=1
pkgdesc='Parser generator for reading, processing, executing, or translating structured text or binary files.'
arch=('any')
url='https://www.antlr3.org/index.html'
license=('BSD')
depends=('java-environment>=6')
provides=("antlr=${pkgver}")
source=("https://www.antlr3.org/download/${_shortname}-${pkgver}-complete.jar"
        'antlr3')
noextract=("${_shortname}-${pkgver}-complete.jar")
sha256sums=('26ca659f47d77384f518cf2b6463892fcd4f0b0d4d8c0de2addf697e63e7326b'
            '3053499ceaa2c155a0c5e0ee456e5745e1d9f534d0f12ae76e3af0190a094dcf')

package() {
  cd "${srcdir}"

  install -D ${_shortname}-${pkgver}-complete.jar \
             "${pkgdir}"/usr/share/java/${_shortname}-${pkgver}-complete.jar
  ln -s antlr-${pkgver}-complete.jar "${pkgdir}"/usr/share/java/antlr3-complete.jar
  install -D antlr3 "${pkgdir}"/usr/bin/antlr3
}
