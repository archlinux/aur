# Maintainer: David Keogh <davekeogh@archlinux.us>

pkgname=flatabulous-theme-git
_pkgname=Flatabulous
pkgver=11.e465c31
pkgrel=1
pkgdesc="This is a Flat theme for Ubuntu and other Gnome based Linux Systems."
arch=('any')
url="https://github.com/anmoljagetia/Flatabulous/"
license=('MIT')
makedepends=('git')
source=("git+https://github.com/anmoljagetia/Flatabulous.git")
sha256sums=('SKIP')
conflicts=('flatabulous-theme')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    install -D -m644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d -m755 "${pkgdir}/usr/share/themes/"
    
    cp -r ${_pkgname} "${pkgdir}/usr/share/themes/" 
    
    rm -rf "${pkgdir}/usr/share/themes/${_pkgname}/.git/"
    rm "${pkgdir}/usr/share/themes/${_pkgname}/LICENSE"
}

