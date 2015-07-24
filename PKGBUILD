# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Adam Goldsmith <adam at adamgoldsmith dot name>

pkgname=mopidy-youtube-git
_pkgname=mopidy-youtube
pkgver=1.0.1.r18.g2e7ce46
pkgrel=1
pkgdesc="Mopidy extension for playing music from Youtube"

arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
provides=("mopidy-youtube")
depends=(
  'mopidy'
  'python2-pykka>=1.1'
  'python2-setuptools'
  'python2-pafy'
  'python2-requests')
makedepends=('python2')

conflicts="mopidy-youtube"
source=("$_pkgname::git+https://github.com/dz0ny/mopidy-youtube.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
