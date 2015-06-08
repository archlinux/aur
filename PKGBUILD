# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=account-plugins
pkgver=0.9
pkgrel=1
pkgdesc="Account configuration plugins for credentials preferences"
arch=('i686' 'x86_64')
url="https://launchpad.net/online-accounts-account-plugins"
license=('GPL')
depends=('credentials-preferences' 'signon-keyring-extension' 'signon-plugin-oauth2')
makedepends=('gobject-introspection' 'vala' 'intltool')
optdepends=('python-gobject: for account-console tool')
options=('!libtool')
install=$pkgname.install
source=(https://launchpad.net/online-accounts-account-plugins/12.10/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('58deed9e3305877bb4db426a51451ec0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
