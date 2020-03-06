# Maintainer: Hector Mtz-Seara <hseara at gmail dot com>

pkgname=dssp
pkgver=3.1.4
pkgrel=1
pkgdesc="Secondary structure assignment for proteins"
arch=('x86_64')
url="http://swift.cmbi.ru.nl/gv/dssp/HTML/distrib.html"
license=('custom')
depends=('boost-libs')
makedepends=('boost')
source=("https://github.com/cmbi/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('496282b4b5defc55d111190ab9f1b615a9574a2f090e7cf5444521c747b272d4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
        ./autogen.sh
        ./configure --prefix=/usr/
        make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        mkdir -p ${pkgdir}/usr/bin
        install -D -m0755 mkdssp ${pkgdir}/usr/bin
        install -D -m0755 test_readpdb ${pkgdir}/usr/bin/
        install -D -m0644 LICENSE_1_0.txt "$pkgdir/usr/share/licenses/dssp/LICENSE"
}

