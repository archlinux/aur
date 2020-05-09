#Maintainer: jnanar <info@agayon.be>

pkgname=python-aionotify
pkgver=0.2.0
pkgrel=1
_pkgbase='aionotify-0.2.0'
_realname='aionotify'
pkgdesc="aionotify is a simple, asyncio-based inotify library."
arch=(any)
url="https://github.com/rbarrois/aionotify"
license=('BSD')
depends=('python')
options=(!emptydirs)
provides=('python-aionotify')
#optdepends=('')

source=('https://github.com/rbarrois/aionotify/archive/v0.2.0.tar.gz')
sha512sums=('23c1a6f86076c069346721cdce89f2aea656ad6afa8c89cbb96ae31bdd478592c9ca475c764da91762dd615454005f82b8666644a3121eb8dfc4b875060d51df')


package() {
  cd $srcdir/$_pkgbase
  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
