# Contributor: Karol "Kenji Takahashi" Wozniak <wozniakk@gmail.com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Maintainer: aksr <aksr at t-com dot me>
_pkgname=ScrollZ
pkgname=scrollz
pkgver=2.3
pkgrel=1
epoch=
pkgdesc="An advanced IRC client based on ircII client."
arch=('i686' 'x86_64')
url="http://www.scrollz.info/"
license=('custom')
groups=()
depends=('ncurses' 'openssl')
makedepends=()
checkdepends=()
optdepends=()
provides=('scrollz')
conflicts=('scrollz-git')
replaces=()
backup=()
install=
changelog=
source=(http://www.scrollz.info/download/$_pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('ffdebe0f0d0e0290c054002904d89d6c')
sha1sums=('991e6acfdf95d84ca159a37336c2d45a624d432f')
sha256sums=('22535bcc54ad752107ab181775d90d9cf1b37648f500d627f428388a9d3710e6')

build() {
  cd $srcdir/$_pkgname-$_pkgname-$pkgver
  unset CPPFLAGS
  ./configure --prefix=/usr \
              --enable-regexp \
              --enable-fish \
              --enable-ipv6 \
              --with-openssl \
              --with-default-server='!chat.freenode.net:6697'
  make
}

package() {
  cd $srcdir/$_pkgname-$_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

