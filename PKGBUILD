pkgname=fcgi-cgi
pkgver=0.2.2.r0.g42b7646
pkgrel=1
pkgdesc="FastCGI application to run cgi applications"
arch=('any')
url="http://cgit.stbuehler.de/gitosis/fcgi-cgi/"
license=('MIT')
source=('git://git.lighttpd.net/fcgi-cgi.git')
md5sums=('SKIP')
makedepends=('libev')

pkgver() {
  cd "$pkgname"
  git describe --long | sed -r 's/^fcgi-cgi-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
