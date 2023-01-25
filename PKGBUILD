# Maintainer: <me at auoeke dot net>
pkgname=circle
pkgver=1.0.0_173
pkgrel=1
pkgdesc='a C++ compiler with many novel language features'
arch=(x86_64)
url=https://circle-lang.org
license=(custom)
depends=('gcc>=10.2')
source=(https://www.circle-lang.org/linux/build_latest.tgz)
sha256sums=(SKIP)

pkgver() {
	./circle -version | head -1 | grep -Po '(?<=version ).+' | sed 's/-/_/g'
}

package() {
    install -Dm 755 circle "${pkgdir}/usr/bin/circle"
    install -Dm 664 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

