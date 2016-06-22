# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
pkgbase='python-elmextensions'
pkgname=('python2-elmextensions' 'python-elmextensions')
pkgdesc="Python library that contains a few more complex elementary objects for easy importing/usage"
pkgver=0.2.0
pkgrel=1
arch=('any')
url='https://github.com/JeffHoogland/python-elm-extensions'
license=('BSD')
depends=('python-efl' 'python2-efl')
source=('https://github.com/JeffHoogland/python-elm-extensions/archive/0.2.0.tar.gz'
        'http://packages.bodhilinux.com/bodhi/pool/main/p/python-elm-extensions/python-elm-extensions_0.2.0bodhi3_all.deb')
sha256sums=('bdda3b8ca9fc9aca43dcd8a65372d0903b28999fd2c4d8a36110dc77ddf0e6be'
            '26dfa2fbc6aa4024cea9053dcb7e3db652d9df1528fd9aa428c2109a2c0f1843')

package_python-elmextensions() {
  
  cd python-elm-extensions-$pkgver
  
  install -Dm644 elmextensions/*.py -t "$pkgdir/usr/lib/python3.5/site-packages/elmextensions/"

# compile python files
  python3 -m compileall -q "${pkgdir}"
  python3 -O -m compileall -q "${pkgdir}"

# install license files
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgbase}/license.txt"
}

package_python2-elmextensions() {
  tar xf data.tar.xz 
  install -dm755 "${pkgdir}/usr/lib/python2.7/site-packages/elmextensions/"
  cd usr/lib/python2.7/dist-packages/elmextensions/
  python2 -m compileall .
  python2 -O -m compileall .
  cp * "${pkgdir}/usr/lib/python2.7/site-packages/elmextensions/"
}
