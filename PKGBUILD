# Maintainer: Marc ROGER de CAMPAGNOLLE <fora at mrdc dot fr>

pkgname=libhdcd
pkgver=1.4
pkgrel=1
pkgdesc="An HDCD decoder library"
arch=('i686' 'x86_64')
url="https://github.com/bp0/libhdcd"
license=('BSD' 'MIT' 'Apache')
makedepends=('autoconf' 'make')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('ac853ae776c1e1847cf27015dc0cd48b')
sha1sums=('878c8e619cebb7a93c34628df4f6d41b6185d3d8')
sha256sums=('0a576ee42fdff97f15b8e82cc2d27ddb1eb667df0c38971f2d5a9afc5a77b8b4')
sha512sums=('21aa3a4f1abb417af228e320a504675d3af0a61ce287ec89601b51abb28dd2e3fc855849e36bd882ebf8b60c024fab481362e9ba4fdf73c6e0ef33995751b25d')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  autoreconf -ivf
  ./configure --prefix="/usr"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
