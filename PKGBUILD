# Maintainer: Josh Taillon <jat255@gmail.com>
pkgname=msr-tools
pkgver=1.3
pkgrel=2
pkgdesc="Console application binaries from the Value of the Model-Specific Register (MSR) Tools Project"
arch=('i686' 'x86_64')
url="https://01.org/msr-tools"
license=('GPL')
depends=('glibc')
source=("https://01.org/sites/default/files/downloads/${pkgname}/${pkgname}-${pkgver}.zip")
md5sums=("67d18527f64fd707c9b7a79f13d19fd5")

build() {
	cd "${pkgname}-master"
	make
}

check() {
	cd "$pkgname-master"
	#make -k check
}

package() {
	cd "$pkgname-master"
	mkdir -p "$pkgdir/usr/bin"
	make sbindir="$pkgdir/usr/bin" install
}
