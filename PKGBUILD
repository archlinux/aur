# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=birtty
pkgver=15.05
pkgrel=1
pkgdesc="Try not to crash that bird"
url="https://github.com/vain/birtty"
license=("custom:PIZZA-WARE LICENSE")
makedepends=("gcc" "make")
conflicts=("birtty-git")
source=("https://github.com/vain/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('f19dcff54291f65b96a4fee692073883ed48bc4b1d02106932676233735a12306d07880fcc6faf9fb5a92b0480a8c5693ee3b0a569574700349cb34f80c1352a')
arch=("i686" "x86_64")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make birtty
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
