# Maintainer: Eric Griffis <dedbox at gmail dot com>
pkgname=twinejs-standalone
pkgver=2.1.3
pkgrel=1
pkgdesc="an open-source tool for telling interactive, nonlinear stories"
arch=('x86_64')
url="http://twinery.org/"
license=('GPL3')
source=("https://bitbucket.org/klembot/twinejs/downloads/twine_${pkgver}_linux64.zip")
md5sums=('1ff968c4a9697ca0f0988917f2be889b')
options=(!strip)

prepare() {
	mv "twine_${pkgver}" "${pkgname}_${pkgver}_linux64"
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/opt"
        cp -r "${pkgname}_${pkgver}_linux64" "$pkgdir/opt"
	ln -s "/opt/${pkgname}_${pkgver}_linux64/Twine" "$pkgdir/usr/bin/Twine"
}
