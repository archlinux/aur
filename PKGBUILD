# Maintainer: SanskritFritz (gmail)

pkgname=cachedir
pkgver=1.2
_filever="${pkgver}-1"
pkgrel=1
pkgdesc="Utility for tagging directories as cache directories."
arch=('i686' 'x86_64')
url="http://liw.fi/cachedir/"
license=('GPLv3')
depends=('python2-cliapp')
source=("http://code.liw.fi/debian/pool/main/c/${pkgname}/${pkgname}_${_filever}.tar.gz")

build() {
  cd "$srcdir/workspace"
  sed -i -e 's/python/python2/' setup.py
  sed -i -e 's/python/python2/' cachedir
  python2 setup.py build
}

package() {
  cd "$srcdir/workspace"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

md5sums=('69b83d4d99e70a4d9cc30992c6e5b8be')

