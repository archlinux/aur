# Maintainer: AlieZ <aaliezz840@gmail.com>

pkgname=bat-asus-battery
pkgver=1.2
pkgrel=1
pkgdesc="Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span"
arch=("x86_64")
makedepends=('make' 'go')
provides=('bat-asus-battery')
conflicts=('bat-asus-battery-bin')
license=('MIT')
url="https://github.com/tshakalekholoane/bat"

source=("bat-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('241249b45659489d86cd128be38c7acde50544e3a8c08ab272468724b4e4091a')

build() {
	    cd "bat-${pkgver}/"
	    make build
	}

package() {
	    cd "bat-${pkgver}/"
	    install -Dm 755 "bin/bat" "${pkgdir}/usr/bin/${pkgname}"
	    install -Dm 644 bat.1 "${pkgdir}"/usr/share/man/man1/${pkgname}.1
	}
