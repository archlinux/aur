# Maintainer : Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor : Jo De Boeck <deboeck.jo@gmail.com>

pkgname=koditools-git
provides=('koditools')
conflicts=('koditools')
replaces=('xbmctools-git')
pkgver=1.2.r11.gf2420c8
pkgrel=1
arch=('any')
license=('GPL2')
pkgdesc="Set of tools to interface with Kodi/XBMC"
url="http://github.com/grimpy/"
depends=('python')
makedepends=('python-distribute' 'git')
optdepends=('nginx: For sending media to kodi')

source=("$pkgname"::'git://github.com/grimpy/koditools.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
