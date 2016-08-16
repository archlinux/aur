pkgname=python2-geomag-hg
_pkgname=geomag
pkgver=r2.1de3ab3af377
pkgrel=1
pkgdesc="Calculates magnetic variation/declination for any latitude, longitude, altitude, and date using WMM2010. Patched for altitude in meters and setup fixes"
arch=('i686' 'x86_64' 'armv7h')
url="http://geomag.googlecode.com/"
license=('LGPL')
depends=('python2')
makedepends=('mercurial')

source=("$pkgname::hg+http://bitbucket.org/normaldotcom/geomag")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd $srcdir/$pkgname
  python2 setup.py install --root="$pkgdir"
}


