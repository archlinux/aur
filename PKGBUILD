# Maintainer: Eric Griffis <dedbox at gmail dot com>
pkgname=twinejs-standalone
pkgver=2.1.0
pkgrel=1
pkgdesc="an open-source tool for telling interactive, nonlinear stories"
arch=('x86_64')
url="http://twinery.org/"
license=('GPL3')
source=("https://bitbucket.org/klembot/twinejs/downloads/twine_${pkgver}_linux64.zip")
md5sums=('d2335fef3bf6019bfdaadc093d5ba06f')
options=(!strip)

prepare() {
	mv "nw/Twine/twine_${pkgver}" "${pkgname}_${pkgver}_linux64"
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/opt"
        cp -r "${pkgname}_${pkgver}_linux64" "$pkgdir/opt"
	ln -s "/opt/${pkgname}_${pkgver}_linux64/Twine" "$pkgdir/usr/bin/Twine"
}
