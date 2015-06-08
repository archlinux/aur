# Maintainer : Jo De Boeck <deboeck.jo@gmail.com>

pkgname=koditools-git
provides=('koditools')
conflicts=('koditools')
replaces=('xbmctools-git')
pkgver=1.0.r18.g2e79de7
pkgrel=1
arch=('any')
license=('GPL2')
pkgdesc="Set of tools to interface with Kodi/XBMC"
url="http://github.com/grimpy/"
depends=('python2')
makedepends=('python2-distribute' 'git')
optdepends=('nginx: For sending media to kodi')

source=("$pkgname"::'git://github.com/grimpy/koditools.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
