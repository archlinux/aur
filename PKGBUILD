# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=keyoxidizer-git
pkgver=0.2.4.r0.gdee8bed
pkgrel=1
pkgdesc="Interactive Keyoxide helper"
arch=('x86_64')
url="https://github.com/shombando/${pkgname%-git}"
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
license=('APACHE')
b2sums=('SKIP')
source=(git+$url)

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^.//'
}

package() {
	install -Dm775 ${pkgname%-git}/${pkgname%-git}.sh "$pkgdir"/usr/bin/${pkgname%-git}
}
