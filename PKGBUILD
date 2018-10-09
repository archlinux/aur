# Maintainer: David Phillips <dbphillipsnz gmail>

_theme=petrichor
_pkgname=lightdm-webkit-theme-${_theme}
pkgname=${_pkgname}-git
pkgver=2.0.r2.g8074f7d
pkgrel=1
pkgdesc="Simple and tidy theme for LightDM's webkit2 greeter"
arch=('any')
url="https://yeah.nah.nz/programming/petrichor/"
license=("BSD")
depends=('lightdm' 'lightdm-webkit2-greeter' 'accountsservice')
source=("${pkgname}::git+https://git.nah.nz/${_theme}")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package () {
	cd "${srcdir}/${pkgname}"
	make install DESTDIR="${pkgdir}"
}
