# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>

pkgname=hib-dlagent-git
_appname=hib-dlagent
pkgver=0.7.8.g4ffd7dd
pkgrel=1
pkgdesc='Tool to download Humble Indie Bundle binaries by file name'
arch=('any')
url='https://github.com/hagabaka/hib-dlagent'
license=('GPL2')
depends=('curl' 'python-humblebundle')
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
  make DESTDIR="$pkgdir" install
}
