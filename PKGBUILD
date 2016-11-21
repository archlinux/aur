# Maintainer: David Phillips <dbphillipsnz gmail>

_theme=petrichor
_pkgname=lightdm-webkit-theme-${_theme}
pkgname=${_pkgname}-git
pkgver=1.0.r9.gc7b7eb1
pkgrel=1
pkgdesc="Simple and tidy theme for LightDM's webkit2 greeter"
arch=('any')
url="https://sighup.nz/programming/petrichor/"
license=("BSD")
depends=('lightdm' 'lightdm-webkit-greeter' 'accountsservice')
source=("${pkgname}::git+https://github.com/phillid/${_theme}.git")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package () {
	cd "${srcdir}/${pkgname}"
	make install DESTDIR="${pkgdir}"
}
