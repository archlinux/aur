#Maintainer: oshaboy <noamgilor{at}protonmail{dot}com>

pkgname=candybox
pkgver=1
pkgrel=1
pkgdesc="Text Based Game"
arch=('any')
url="https://github.com/candybox2"
license=('GPL')
depends=(chromium)
optdepends=()
makedepends=(git)
source=("git+https://github.com/candybox2/candybox.git")
sha256sums=('SKIP')

build(){
	echo -e '#!/bin/sh\nchromium -app="file:///opt/candybox/index.html"' >| ${srcdir}/candybox.sh
}

package(){
	mkdir "${pkgdir}/opt"
	cp -r "${srcdir}/candybox" "${pkgdir}/opt/candybox"
	find  ${pkgdir}/opt/candybox -type d | xargs chmod 755
	install -Dm755 ${srcdir}/candybox.sh ${pkgdir}/usr/bin/candybox
}
