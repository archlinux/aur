## Original CTorrent 
## Maintainer: damir 
## Contributor: lanrat 
## 
## Enhanced CTorrent 
## Modified by: lydgate 
## Mod to dnh3 by durbatuluk 

# Maintainer: aksr <aksr at t-com dot me>
_pkgname=ctorrent
pkgname=enhanced-ctorrent
pkgver=dnh3.3.2
pkgrel=1
epoch=
pkgdesc="A BitTorrent client implemented in C++, with bugfixes and performance enhancements."
arch=('i686' 'x86_64')
url="http://www.rahul.net/dholmes/ctorrent/"
license=('GPL')
groups=()
depends=('openssl')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('ctorrent-dnh')
replaces=('ctorrent')
backup=()
options=()
install=
changelog=
source=("http://www.rahul.net/dholmes/ctorrent/$_pkgname-$pkgver.tar.gz") 
noextract=()
md5sums=('59b23dd05ff70791cd6449effa7fc3b6')
sha1sums=('d4e221f0292268f80e2430ce9d451dd64cf1ffaa')
sha256sums=('c87366c91475931f75b924119580abd06a7b3cb3f00fef47346552cab1e24863')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 UserGuide $pkgdir/usr/share/doc/$_pkgname/UserGuide
  install -Dm644 ChangeLog $pkgdir/usr/share/doc/$_pkgname/ChangeLog
  install -Dm644 README-DNH.TXT $pkgdir/usr/share/doc/$_pkgname/README-DNH.TXT
}

