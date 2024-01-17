# Maintainer: Duan <duan@d-jy.net>
pkgname=antlr3
_shortname=${pkgname:0:-1}
pkgver=3.5.3
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
sha256sums=('e781de9b3e2cc1297dfdaf656da946a1fd22f449bd9e0ce1e12d488976887f83'
            '3053499ceaa2c155a0c5e0ee456e5745e1d9f534d0f12ae76e3af0190a094dcf')

package() {
  cd "${srcdir}"

  install -D ${_shortname}-${pkgver}-complete.jar \
             "${pkgdir}"/usr/share/java/${_shortname}-${pkgver}-complete.jar
  ln -s antlr-${pkgver}-complete.jar "${pkgdir}"/usr/share/java/antlr3-complete.jar
  install -D antlr3 "${pkgdir}"/usr/bin/antlr3
}
