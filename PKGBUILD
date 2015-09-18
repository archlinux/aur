# Maintainer : Jo De Boeck <deboeck.jo@gmail.com>

pkgname=koditools-git
provides=('koditools')
conflicts=('koditools')
replaces=('xbmctools-git')
psource=("$pkgname"::"git://github.com/grimpy/koditools.git#tag=$pkgver")kgrel=1
pkgrel=1
pkgver=20150911.6b5a228
arch=('any')
license=('GPL2')
pkgdesc="Set of tools to interface with Kodi/XBMC"
url="http://github.com/grimpy/"
depends=('python2')
makedepends=('python2-distribute' 'git')
optdepends=('nginx: For sending media to kodi')

source=("$pkgname"::"git://github.com/grimpy/koditools.git")
md5sums=('SKIP')

build() {
    cd
}

pkgver() {
    cd "$srcdir/$pkgname"
    git log -1 --date=short --format="%cd.%h" | tr -d '-'
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
