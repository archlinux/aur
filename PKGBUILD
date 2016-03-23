# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Contributor: Gustavo Castro <gustawho[at]gmail[dot]com>
# Submitter: acrox999 <acrox999[at]gmail[dot]com>

pkgname=gtk-theme-iris-light-git
_pkgname=iris-light
pkgver=105.aca7c34
pkgrel=1
pkgdesc="A flat theme that uses varying shades and tones to create distinction and a modern experience."
arch=('any')
url="http://thevirtualdragon.deviantart.com/art/Iris-Light-Beta-428948909"
license=('GPL3')
optdepends=("gtk-engine-murrine: gtk2 bindings"
	"gtk3: gtk3 bindings")
makedepends=('git')
provides=('gtk-theme-iris-light')
conflicts=('gtk-theme-iris-light')
changelog="CHANGELOG"
source=(${_pkgname}::'git+https://github.com/xyl0n/iris-light.git')
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
