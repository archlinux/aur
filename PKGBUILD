# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=realmd
pkgver=0.16.2
pkgrel=1
pkgdesc="DBus service for joining hosts to Active Directory and FreeIPA realms"
arch=(i686 x86_64)
url="http://freedesktop.org/software/realmd/"
license=(GPL3)
depends=(adcli dbus krb5 openldap packagekit polkit)
makedepends=(docbook-xsl intltool python2 xmlto)
source=("http://www.freedesktop.org/software/realmd/releases/$pkgname-$pkgver.tar.gz"
        "http://www.freedesktop.org/software/realmd/releases/$pkgname-$pkgver.tar.gz.sig")
sha256sums=('abcdcd48c46bddd5b5f3716fd036f7436f2df1796c2e3bf345ae92a9a76801f2'
            'SKIP')
validpgpkeys=('C0F67099B808FB063E2C81117BFB1108D92765AF')

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --sysconfdir=/etc       \
    --localstatedir=/var    \
    --with-distro=defaults  ;
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
