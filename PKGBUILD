# Maintainer: Luigi Operoso <brokenpip3[at]gmail[dot]com>
pkgname=lsix-git
_pkgname=lsix
pkgver=1
pkgrel=1
pkgdesc="Like ls but for images, shows thumbnails in terminal using sixel graphics"
arch=('any')
url="https://github.com/hackerb9/lsix"
license=('GPL3')
depends=('imagemagick')
makedepends=('git')
source=("git+https://github.com/hackerb9/lsix")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package () {
	cd "${_pkgname}"
	install -Dm755 lsix "${pkgdir}/usr/bin/${_pkgname}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
