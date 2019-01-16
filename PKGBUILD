# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Adam Goldsmith <adam at adamgoldsmith dot name>

pkgname=mopidy-youtube-git
_pkgname=mopidy-youtube
pkgver=v2.0.2.r10.g422835e
pkgrel=1
pkgdesc="Mopidy extension for playing music from Youtube"

arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
  'mopidy>=1.0'
  'python2-pykka>=1.1'
  'python2-setuptools'
  'python2-pafy'
  'python2-requests')
makedepends=('python2' 'git')

conflicts=("mopidy-youtube")
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
