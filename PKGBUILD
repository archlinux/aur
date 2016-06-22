# Maintainer: Doug Newgard <scimmia at archlinux dot info>
pkgname='python2-elmextensions'
pkgdesc='Python2 library that contains a few more complex elementary objects for easy importing/usage'
pkgver='0.2.0'
pkgrel=1
arch=('any')
url='https://github.com/JeffHoogland/python-elm-extensions'
license=('BSD')
depends=("python2-efl")
source=('http://packages.bodhilinux.com/bodhi/pool/main/p/python-elm-extensions/python-elm-extensions_0.2.0bodhi3_all.deb')
sha256sums=('26dfa2fbc6aa4024cea9053dcb7e3db652d9df1528fd9aa428c2109a2c0f1843')
build() {
          cd "${srcdir}"
          tar xf data.tar.xz
          cd usr/lib/python2.7/dist-packages/elmextensions/
          python2 -m compileall .
          python2 -O -m compileall .
}
package() {
          install -dm644 "${pkgdir}/usr/lib/python2.7/dist-packages/elmextensions/"
          cp -rf usr/lib/python2.7/dist-packages/elmextensions/* "${pkgdir}/usr/lib/python2.7/dist-packages/elmextensions/"
}
