#Maintainer: oshaboy <noamgilor{at}protonmail{dot}com>

pkgname=candybox2
pkgver=1
pkgrel=1
pkgdesc="Text Based Incremental Game"
arch=('any')
url="https://github.com/candybox2"
license=('GPL')
depends=(chromium)
optdepends=()
makedepends=(git)
source=("git+https://github.com/candybox2/candybox2.github.io.git")
sha256sums=('SKIP')

build(){
	echo -e '#!/bin/sh\nchromium -app="file:///opt/candybox2/index.html"' >| ${srcdir}/candybox2.sh
}

package(){
	mkdir "${pkgdir}/opt"
	cp -r "${srcdir}/candybox2" "${pkgdir}/opt/candybox2"
	find  ${pkgdir}/opt/candybox2 -type d | xargs chmod 755
	install -Dm755 ${srcdir}/candybox2.sh ${pkgdir}/usr/bin/candybox2
}
