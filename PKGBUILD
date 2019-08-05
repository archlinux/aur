# Maintainer: Thomas Hipp <thomashipp at gmail dot com>
pkgname=libco
pkgver=1.0.2
pkgrel=1
pkgdesc="Cooperative multithreading library"
arch=('x86_64')
url="https://github.com/canonical/libco"
license=('custom')
source=("https://github.com/canonical/${pkgname}/archive/v${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('8876aa8e61f07b37adb3ad422b369ecf9bf6fad20ce691428c35719ba5f16615'
            '8938af6b9204bd76eccc205b1e62829ab6d0973d33038db4423903640e5bca64'
)

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 libco.so "${pkgdir}/usr/lib/libco.so"
	install -Dm644 libco.h "${pkgdir}/usr/include/libco.h"
	install -Dm644 libco.pc "${pkgdir}/usr/lib/pkgconfig/libco.pc"
	install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
