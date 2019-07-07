# Maintainer: Nichlas Severinsen <ns@nsz.no>
pkgname=libray-git
_gitname="libray"
pkgver=0.0.2
pkgrel=1
pkgdesc="LibRay aims to be a Libre (FLOSS) Python application for unencrypting, extracting, repackaging, and encrypting PS3 ISOs."
arch=("any")
license=("GPLv3")
depends=("python" "python-pip")

source=("https://notabug.org/necklace/${_gitname}/archive/${pkgver}.tar.gz")

sha256sums=("b0ec577f10d7dfba70c2dc695fa54103d76fc0b30f3deb509f9bc551f1439ad7")

package() {
	cd $srcdir/$_gitname
	python setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

