pkgname=qlot
pkgver=1.4.1
pkgrel=1
pkgdesc="Common Lisp library manager"
url="https://github.com/fukamachi/qlot"
arch=('any')
license=('MIT')
depends=('sbcl')
source=("https://github.com/fukamachi/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('41f0ce899b71cd5200d31842020af05fe0cfb980de58fceeb2e18bc7aa4ef539')

build() {
	cd ${srcdir}/${pkgname}

	printf '#!/bin/sh\nexec /usr/lib/%s/scripts/run.sh "$@"\n' "$pkgname" > "$srcdir/${pkgname}.sh"
}

package() {
	install -dm755 $pkgname "$pkgdir"/usr/lib
	cp -r $srcdir/${pkgname} ${pkgdir}/usr/lib/
	install -Dm755 $srcdir/${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
}
