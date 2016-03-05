# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=adcli
pkgver=0.8.1
pkgrel=1
pkgdesc="Active Directory account management tool"
arch=(i686 x86_64)
url="http://freedesktop.org/software/realmd/"
license=(GPL3)
depends=(krb5 openldap)
makedepends=(docbook-xsl intltool xmlto)
source=("https://www.freedesktop.org/software/realmd/releases/$pkgname-$pkgver.tar.gz"
        "https://www.freedesktop.org/software/realmd/releases/$pkgname-$pkgver.tar.gz.sig")
sha256sums=('5a611bfc55e563d94b526e975aac7c069304fe305f86076800bf7aae71bec7b5'
            'SKIP')
validpgpkeys=('C0F67099B808FB063E2C81117BFB1108D92765AF')

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --sysconfdir=/etc       ;
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
