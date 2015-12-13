# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Contributor: Gustavo Castro <gustawho[at]gmail[dot]com>
# Submitter: acrox999 <acrox999[at]gmail[dot]com>

pkgname=gtk-theme-iris-dark-git
_pkgname=iris-dark
pkgver=94.6af34fd
pkgrel=1
pkgdesc="A flat theme that uses varying shades and tones to create distinction and a modern experience. It supports Gtk 3.10, Gtk 3.12 and Gtk 2 (using the Murrine engine)."
arch=('any')
url="http://thevirtualdragon.deviantart.com/art/Iris-Dark-Gtk-Theme-v1-9-429628194"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
makedepends=('git')
provides=('gtk-theme-iris-dark')
conflicts=('gtk-theme-iris-dark')
changelog=('CHANGELOG')
source=(${_pkgname}::'git+https://github.com/xyl0n/iris.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -dm755 "${pkgdir}/usr/share/themes/${_pkgname}"
	rm -rf {.git,CREDITS,LICENSE,README,README.md}
	cp -dpr --no-preserve=ownership . "${pkgdir}/usr/share/themes/${_pkgname}/"
}
