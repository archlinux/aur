# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>

pkgname=hib-dlagent-git
_appname=hib-dlagent
pkgver=0.7.1.g42adb30
pkgrel=1
pkgdesc='Tool to download Humble Indie Bundle binaries by file name (uses PhantomJS to support new Humble Bundle site)'
arch=('any')
url='https://github.com/hagabaka/hib-dlagent'
license=('GPL2')
depends=('curl' 'python-humblebundle-git')
makedepends=('git')
provides=("$_appname")
conflicts=("$_appname")
optdepends=('gnome-keyring-query: encrypted account password support')
source=('git+https://github.com/hagabaka/hib-dlagent.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_appname"
  git describe --tags | sed 's/^v//; s/-/./g'
}

package() {
  cd "$srcdir/$_appname"
  DEST="$pkgdir" ./install.sh
}
