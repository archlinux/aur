# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: WAntilles <wantilles@adslgr.com>
# Contributor: Lucas Tsatiris

pkgname=systester
pkgname=(systester systester-cli)
_pkgname=systester
pkgver=1.5.1
pkgrel=4
pkgdesc="System Stability Tester is a RAM/CPU burning and benchmarking program based on calculating pi."
license=('GPL')
arch=('i686' 'x86_64')
url="http://systester.sourceforge.net/"
makedepends=('qt4>=4.5.3' 'gmp>=4.2.1')
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}/1.5.0/${pkgname}-${pkgver}.tar.gz)
sha256sums=('8e88b368d35f45303c586f4028ee010a0e5e67d89d8494cad0fd53359b741df5')

build() {
cd "$srcdir"/$pkgname-$pkgver/cli
make

cd "$srcdir"/"$pkgname"-"$pkgver"
./configure --prefix=/usr
make
}

package_systester() {
pkgdesc="System Stability Tester is a RAM/CPU burning and benchmarking program based on calculating pi."
depends=('qt4>=4.5.3' 'gmp>=4.2.1')

install -Dm755 "$srcdir/$pkgname-$pkgver/systester" "$pkgdir/usr/bin/systester"
}

package_systester-cli() {
pkgdesc="System Stability Tester is a RAM/CPU burning and benchmarking program based on calculating pi."
depends=('gmp>=4.2.1')

install -Dm755 "$srcdir/$_pkgname-$pkgver/cli/systester-cli" "$pkgdir/usr/bin/systester-cli"
install -Dm755 "$srcdir/$_pkgname-$pkgver/cli/systester-lite" "$pkgdir/usr/bin/systester-lite"
}

