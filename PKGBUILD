# Maintainer: Aetf <aetf at unlimitedcodeworks dot xyz>
pkgname=libecap
pkgver=1.0.1
pkgrel=1
pkgdesc="eCAP is a software interface that allows a network application to outsource content analysis and adaptation to a loadable module."
arch=('i686' 'x86_64')
url="http://www.e-cap.org/Home"
license=('BSD')
depends=(gcc-libs)
source=('https://launchpad.net/ecap/1.0/1.0.1/+download/libecap-1.0.1.tar.gz')
sha256sums=('7c166d997a079110dcc55e9b81eb70b4d73c08b2bcb986fa81bbf78bb62ec8f4')

prepare() {
  cd "$srcdir/libecap-$pkgver"

  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/libecap-$pkgver"

  make
}

package() {
  cd "$srcdir/libecap-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
