# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
pkgname=('python-elmextensions')
pkgdesc="Python library that contains a few more complex elementary objects for easy importing/usage"
pkgver=0.2.0
pkgrel=1
arch=('any')
url='https://github.com/JeffHoogland/python-elm-extensions'
license=('BSD')
depends=('python-efl')
source=('https://github.com/JeffHoogland/python-elm-extensions/archive/0.2.0.tar.gz')
sha256sums=('bdda3b8ca9fc9aca43dcd8a65372d0903b28999fd2c4d8a36110dc77ddf0e6be')

package() {
  
  cd "python-elm-extensions-${pkgver}/elmextensions"
  python3 -m compileall .
  python3 -O -m compileall .
  install -dm644 "${pkgdir}/usr/lib/python3.5/site-packages/elmextensions/"
  cp -rf * "${pkgdir}/usr/lib/python3.5/site-packages/elmextensions/"
  cd ..
# install license files
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgbase}/license.txt"
}

