# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
pkgname=crackpkcs12
pkgver=0.2.11
pkgrel=2
pkgdesc="A tool to audit PKCS12 files passwords"
arch=(x86_64)
depends=(openssl)
url=http://crackpkcs12.sourceforge.net
license=(GPL-3.0-only)
source=(http://download.sourceforge.net/project/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('9cfd0aa1160545810404fff60234c7b6372ce7fcf9df392a7944366cae3fbf25')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make install DESTDIR="$pkgdir"
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
