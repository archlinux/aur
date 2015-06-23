# Contributor:  wakeup <wakeup@erehwon.de>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=retawq
pkgver=0.2.6c
pkgrel=2
epoch=
pkgdesc="An interactive, multi-threaded network client for text terminals."
arch=('i686' 'x86_64')
url="http://retawq.sourceforge.net/"
license=('GPL')
groups=()
depends=('glibc' 'ncurses')
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
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('ee60188bea597680bd39e435a8c73ff9')
sha1sums=('ac99979e99ae3b3edba547dd23d54c8f5fb3c6f5')
sha256sums=('a42e82494f00e054c2de1b065bbc8fb439d93eb69f9b97cc4868e71e48a9eae0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --path-prefix=$pkgdir/usr \
              --path-doc=$pkgdir/usr/share/doc/retawq \
              --path-man=$pkgdir/usr/share/man \
              --set-tg=ncurses \
              --enable-textmodemouse \
              --enable-i18n \
              --enable-news \
              --enable-cookies \
              --enable-ipv6 \
              --enable-local-cgi \
              --set-tls=2 \
              --set-execext=1 \
              --set-ced=1 \
              --set-threading=1
## built-in run-time configuration file [DISABLED]
              ## --enable-birtcfg 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

