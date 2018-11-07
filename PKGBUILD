# Maintainer: Alejandro Valdes <alejandrovaldes@live.com>

pkgname='mozart2-compiler'
pkgver='2.0.1'
pkgrel=1
pkgdesc='An open source implementation of Oz 3. (Compiler Only)'
arch=('x86_64')
url='https://mozart.github.io/'
license=('BSD')
depends=('tk')
conflicts=('mozart2' 'mozart1-bin')
source=(https://github.com/mozart/mozart2/releases/download/v${pkgver}/mozart2-${pkgver}-x86_64-linux.rpm
	https://raw.githubusercontent.com/mozart/mozart2/master/LICENSE.txt)
sha512sums=('92eba2ca12ee8fab50de983fca551fb61c1970b229c6c2e4006e61c2fd569b05b1f645d220ab04c28f196c6ebb63ab51b34fcb1a9b23ca47ecbd3bdf88e67d6e'
            'c21dfa28faa03a703d853416126d2135330919036b33b40c790569bccb9a0fdbb3cd3acde0cd001a84333f7fe25a18d02be970612720d7726b01a26f0317a78b')
package() {
	cd "$srcdir"
	rm usr/bin/oz
	rm -r usr/share/applications
	rm -r usr/lib
	install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	cp -R usr "$pkgdir"
}
