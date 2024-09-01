# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ecmerge-bin
pkgver=2.5.205
pkgrel=1
pkgdesc='Compares and merges text files, images, binaries and folders visually'
arch=('x86_64')
url='https://www.elliecomputing.com/en/Products/merge_overview.asp'
license=('custom')
provides=("ecmerge=${pkgver}")
conflicts=('ecmerge')
source=("http://www.soft.elliecomputing.com/soft/ecmerge-$pkgver.linux.x86.tbz"
        "local://ecmerge.desktop")
sha256sums=('173ee0733bc50fbcf1c6743903629882984560d051420c3ff0217d74b7a37077'
            'SKIP')

package() {
	cp -r opt "$pkgdir/"

	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/elliecomputing/ecmerge/guimerge "$pkgdir/usr/bin/ecmerge"

	mkdir -p "$pkgdir/usr/share/applications"
	cp ecmerge.desktop "$pkgdir/usr/share/applications"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	ln -s /opt/elliecomputing/ecmerge/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
