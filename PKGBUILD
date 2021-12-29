# Maintainer: Matthias Debus <psic4t at data dot haus>

pkgname=qcal
pkgver=0.8.2
pkgrel=1
pkgdesc='Console-based quick calendar for CalDAV'
arch=('any')
url='https://git.sr.ht/~psic4t/qcal'
license=('GPL')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~psic4t/qcal/archive/${pkgver}.tar.gz")
sha512sums=('fbfe3beb54a7436e3bc9f7bb8839e8af7ca60c8e07becb537795ef6faaad7bb9ce966a83c238d468f8449dc6b5770b6a590f977e26c6a63518b41a35bf6b3120')

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
