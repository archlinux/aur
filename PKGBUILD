# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=bmz-cursor-theme-git
pkgver=r3.a2eb059
pkgrel=1
pkgdesc="Mouse cursor for your X11 desktop. Inspiration was drawn from various sources, including DMZ and Breeze, but design manages to be quite unique."
arch=('any')
url="https://github.com/tonylambiris/BMZ-cursor"
license=('GPL')
source=("${pkgname}::git+${url}")
makedepends=('unzip')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"

    install -d -m755 $pkgdir/usr/share/icons/BMZ-cursor
    cp -a * $pkgdir/usr/share/icons/BMZ-cursor
}
