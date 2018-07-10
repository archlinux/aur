# Maintainer: Kirill Gagarski <gagarski@kspt.icc.spbstu.ru>
pkgname=antlr3
_shortname=${pkgname:0:-1}
pkgver=3.5.2
pkgrel=1
pkgdesc='Parser generator for reading, processing, executing, or translating structured text or binary files.'
arch=('any')
url='http://www.antlr3.org/index.html'
license=('BSD')
depends=('java-environment>=6')
provides=("antlr=${pkgver}")
source=("https://www.antlr3.org/download/${_shortname}-${pkgver}-complete.jar"
        'antlr3')
noextract=("${_shortname}-${pkgver}-complete.jar")
sha256sums=('acfa69f928a0f1653555bda73091efca'
            'a0fab9317be2f6965bd40c4424368d59')

package() {
  cd "${srcdir}"

  install -D ${_shortname}-${pkgver}-complete.jar \
             "${pkgdir}"/usr/share/java/${_shortname}-${pkgver}-complete.jar
  ln -s antlr-${pkgver}-complete.jar "${pkgdir}"/usr/share/java/antlr3-complete.jar
  install -D antlr3 "${pkgdir}"/usr/bin/antlr3
}
