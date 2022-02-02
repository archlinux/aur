# Maintainer: Matthias Debus <psic4t at data dot haus>

pkgname=qcal
pkgver=0.8.3
pkgrel=1
pkgdesc='Console-based quick calendar for CalDAV'
arch=('any')
url='https://git.sr.ht/~psic4t/qcal'
license=('GPL')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~psic4t/qcal/archive/${pkgver}.tar.gz")
sha512sums=('ed0367e326c67e823fd5b47a98849c0de2fc44fce2c1cbd996805b491d833fcd6918392d7b39fe861ab8967ce485f4cde28fa256dcc1e1faf676aa21c1ed84ab')

build() {
	cd ${pkgname}-${pkgver}
	make
}

package() {
	cd ${pkgname}-${pkgver}
	install -Dm755 qcal "$pkgdir/usr/bin/qcal"
	install -Dm644 config-sample.json "$pkgdir"/usr/share/"${pkgname}"/config-sample.json
	install -Dm644 README.md "$pkgdir"/usr/share/"${pkgname}"/README.md
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/LICENSE
}
