# Maintainer: Nichlas Severinsen <ns@nsz.no>
pkgname=libray-git
_gitname="libray"
pkgver=0.0.1
pkgrel=1
pkgdesc="LibRay aims to be a Libre (FLOSS) Python application for unencrypting, extracting, repackaging, and encrypting PS3 ISOs."
arch=("any")
license=("GPLv3")
depends=("python" "python-pip")

source=("https://notabug.org/necklace/${_gitname}/archive/${pkgver}.tar.gz")

sha256sums=("35d04f09d8ae019be4f62067dad19fce14aa5436e677ba22b3510b58117a5aa8")

package() {
	cd $srcdir/$_gitname
	python setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

