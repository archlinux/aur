# Maintainer: David Phillips <dbphillipsnz gmail>

_theme=petrichor
_pkgname=lightdm-webkit-theme-${_theme}
pkgname=${_pkgname}-git
pkgver=r14.b4607e0
pkgrel=1
pkgdesc="Simple and tidy theme for LightDM's webkit2 greeter"
arch=('any')
url="https://sighup.nz/programming/petrichor/"
license=("BSD")
depends=('lightdm' 'lightdm-webkit-greeter')
source=("${pkgname}::git+https://github.com/phillid/${_theme}.git")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package () {
	cd "${srcdir}/${pkgname}"
	make install DESTDIR="${pkgdir}"
}
