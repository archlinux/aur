# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-geventhttpclient-git
pkgver=20141102
pkgrel=1
pkgdesc="A high performance, concurrent HTTP client library for Python with gevent"
arch=('i686' 'x86_64')
depends=('python2' 'python2-gevent')
makedepends=('git' 'python2-setuptools')
url="https://github.com/gwik/geventhttpclient"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/gwik/geventhttpclient)
sha256sums=('SKIP')
provides=('python2-geventhttpclient')
conflicts=('python2-geventhttpclient')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  python2 setup.py install -O1 --root="$pkgdir"
}
