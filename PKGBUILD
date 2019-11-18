# Maintainer: Thomas Hipp <thomashipp at gmail dot com>
pkgname=libco
pkgver=20
pkgrel=1
pkgdesc="Cooperative multithreading library"
arch=('x86_64')
url="https://github.com/canonical/libco"
license=('custom')
source=("https://github.com/canonical/${pkgname}/archive/v${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('6d6d6ada15a36224ee4aa59b8361c4b90f1ffb6c077b4932aa6e6344ee91be0e'
            '8938af6b9204bd76eccc205b1e62829ab6d0973d33038db4423903640e5bca64'
)

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="${pkgdir}" make install
	install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
