# Maintainer: Manuel Mendez <mmendez534@gmail.com>
# Submitter: Robin Martinjak <rob@kingofnerds.net>

# vim:set ts=2 sw=2 et:

pkgname=makeself
pkgver=2.3.1
pkgrel=0
pkgdesc="Utility to create self-extracting packages"
arch=('any')
url="http://megastep.org/makeself"
license=('GPL')
depends=('bash')
source=("https://github.com/megastep/$pkgname/archive/release-$pkgver.tar.gz")

build() {
	cd $srcdir/$pkgname-release-$pkgver
	sed -ie 's|^HEADER=.*|HEADER=/usr/share/makeself/makeself-header.sh|' makeself.sh
}

package() {
	cd $srcdir/$pkgname-release-$pkgver
	install -d $pkgdir/usr/{bin,share/{$pkgname,man/man1}}
	install -m644 makeself.lsm README.md $pkgdir/usr/share/$pkgname
	install -m644 makeself.1 $pkgdir/usr/share/man/man1/
	install -m755 makeself.sh $pkgdir/usr/bin/makeself
	install -m755 makeself-header.sh $pkgdir/usr/share/$pkgname
}

sha512sums=('7fb869b7d468e01b7f30fbed16256e2ba591ffef9138eed24da3c647832ac80f1f5163fba5a6dfb580eed3a6436503341cae3ca4348973679532e625b0fb7f56')
