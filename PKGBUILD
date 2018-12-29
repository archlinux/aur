# Maintainer: Luigi Operoso <brokenpip3[at]gmail[dot]com>
pkgname=lsix-git
_pkgname=lsix
pkgver=1.6.0.r4.g0a1ee99
pkgrel=2
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
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package () {
	cd "${_pkgname}"
	install -Dm755 lsix "${pkgdir}/usr/bin/${_pkgname}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
