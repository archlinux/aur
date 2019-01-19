# Maintainer: aksr <aksr at t-com dot me>
pkgname=xrn
pkgver=10.11
pkgrel=1
epoch=
pkgdesc="An X-based interface to the USENET news system that uses the NNTP remote news server."
arch=('i686' 'x86_64')
url="http://www.mit.edu/people/jik/software/xrn.html"
license=('custom')
groups=()
depends=('xorg-server')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("ftp://rtfm.mit.edu/pub/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('86cdb58b2a31f7ed04da8aec30284094')
sha1sums=('4dfe8063b1356c74f2e92ab84d93ff464a174e70')
sha256sums=('a6b9ea37c2338582e9caa95c41c4d4ec8ed196e93c040f0ac3520e8a3c13d4fd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

