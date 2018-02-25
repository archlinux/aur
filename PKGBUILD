# Maintainer: Alejandro Valdes <alejandrovaldes@live.com>

pkgname='mozart2-compiler'
pkgver='2.0.0_alpha.0.4140'
pkgrel=1
pkgdesc='An open source implementation of Oz 3.'
arch=('x86_64')
url='https://mozart.github.io/'
license=('BSD')
depends=('tk')
conflicts=('mozart2')
source=(https://github.com/alevalv/mozart2-compiler-archlinux/releases/download/1.0/bin.rpm
	https://raw.githubusercontent.com/mozart/mozart2/master/LICENSE.txt)
sha512sums=('dbdf8619d41918e7403a8ea3a7759fdc15013c9bece37ce10d16371428f15c66a31be3624175a4d49ce318647200eac56806922ba240935e421e061e32d8690c'
            'c21dfa28faa03a703d853416126d2135330919036b33b40c790569bccb9a0fdbb3cd3acde0cd001a84333f7fe25a18d02be970612720d7726b01a26f0317a78b')
package() {
	cd "$srcdir"
	rm usr/bin/oz
	rm -r usr/share/applications
	install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	cp -R usr "$pkgdir"
}
