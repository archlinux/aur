# Maintainer: Matthias Debus <psic4t at data dot haus>

pkgname=qcal
pkgver=0.8.4
pkgrel=1
pkgdesc='Console-based quick calendar for CalDAV'
arch=('any')
url='https://git.sr.ht/~psic4t/qcal'
license=('GPL')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~psic4t/qcal/archive/${pkgver}.tar.gz")
sha512sums=('4084af17690a6f3f52329c74f2d8bfb187fa8a749c390f117256b03d2263acb0850d1ea4dde434fb8c083a3327d6c0ae6407ac81bfebf82ce6c3705a07701eac')

build() {
	cd ${pkgname}-${pkgver}
	make
}

package() {
	cd ${pkgname}-${pkgver}
	install -Dm755 qcal "$pkgdir/usr/bin/qcal"
	install -Dm644 config-sample.json "$pkgdir"/usr/share/doc/"${pkgname}"/config-sample.json
	install -Dm644 README.md "$pkgdir"/usr/share/doc/"${pkgname}"/README.md
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/LICENSE
}
