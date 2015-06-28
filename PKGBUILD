# Maintainer: aksr <aksr at t-com dot me>
pkgname=xrn
pkgver=10.00
_pkgver=10.00-beta-3
pkgrel=2
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
source=("ftp://rtfm.mit.edu/pub/$pkgname/$pkgname-$_pkgver.tar.gz")
noextract=()
md5sums=('ed99144a561e7e356832f9e86fa496e0')
sha1sums=('1f54457b9fb544a7b88a1b0dc8e1f7f1c1c137da')
sha256sums=('dd3ac540d50a1d00d1f08b4f0bcca43b23a0bf3732bfffc5fe2b66e66f66d5c6')

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "$srcdir/$pkgname-$_pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

