# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=adcli
pkgver=0.7.5
pkgrel=2
pkgdesc="Active Directory account management tool"
arch=(i686 x86_64)
url="http://freedesktop.org/software/realmd/"
license=(GPL3)
depends=(krb5 openldap)
makedepends=(docbook-xsl intltool xmlto)
source=("http://www.freedesktop.org/software/realmd/releases/$pkgname-$pkgver.tar.gz"
        "http://www.freedesktop.org/software/realmd/releases/$pkgname-$pkgver.tar.gz.sig")
sha256sums=('fc4a0e3a515b3a2cb3ce670a180f0215f252efb3d6c762dc8fa7204485a686c7'
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
