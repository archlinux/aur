# Maintainer: nixi <nixi at cock dot li>

pkgname=opener
pkgver=1.0
pkgrel=1
pkgdesc='Simple xdg-open replacement written in Scheme'
arch=('any')
url='https://git.sr.ht/~dawidjkubis/opener'
license=('UNLICENSE')
provides=('xdg-utils')
conflicts=('xdg-utils')
depends=('guile' 'file')
source=("https://git.sr.ht/~dawidjkubis/opener/archive/${pkgver}.tar.gz")
sha256sums=('d5d6a43030d3bed7982c41301a549c11cc9995f55267e10fe81666091a9b153f')

package() {
	cd "$srcdir/opener-$pkgver"
	install -D -m755 "opener.scm" "${pkgdir}/usr/bin/opener"
	ln -s "/usr/bin/opener" "${pkgdir}/usr/bin/xdg-open"
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
