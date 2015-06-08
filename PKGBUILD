# Maintainer: graysky <graysky AT archlinux dot us>
# Contributor: Chrysalis <mindaxis@gmail.com>

pkgname=mprime-bin
_pkgname=mprime
pkgver=286
pkgrel=1
pkgdesc="A GIMPS, distributed computing project client, dedicated to finding Mersenne primes. Precompiled binary version."
arch=('i686' 'x86_64')
url="http://www.mersenne.org"
license=('custom')
provides=('mprime')
conflicts=('mprime')
depends=('gcc-libs')
source=("http://www.mersenne.info/gimps/p95v$pkgver.linux64.tar.gz")
sha256sums=('185959f251f1c91591ced4436065e6837758e7d0fcce6cceaba04c4ba4161313')

if [[ $CARCH = "i686" ]]; then
	source=("http://www.mersenne.info/gimps/p95v$pkgver.linux32.tar.gz")
fi

package() {
	install -Dm755 mprime ${pkgdir}/usr/bin/mprime
	install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${_pkgname}/license.txt
	install -Dm644 readme.txt ${pkgdir}/usr/share/doc/${_pkgname}/readme.txt
	install -Dm644 stress.txt ${pkgdir}/usr/share/doc/${_pkgname}/stress.txt
	install -Dm644 undoc.txt ${pkgdir}/usr/share/doc/${_pkgname}/undoc.txt
	install -Dm644 whatsnew.txt ${pkgdir}/usr/share/doc/${_pkgname}/whatsnew.txt
}

# vim:set ts=2 sw=2 et:
