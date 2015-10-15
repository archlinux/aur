# Maintainer: mortzu <me@mortzu.de>
pkgname=cups-cloud-print
pkgver=20140814.3.r94.g3899bd3
pkgrel=1
pkgdesc='Google Cloud Print driver for CUPS'
arch=('i686' 'x86_64')
url='https://www.niftiestsoftware.com/cups-cloud-print/'
license=('GPL3')
depends=('python2-httplib2' 'python2-pycups')
makedepends=('git')
source=("$pkgname"::'git+https://github.com/simoncadman/CUPS-Cloud-Print.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/release.//g'
}

build() {
  cd "$pkgname"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install
}
