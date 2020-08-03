# Maintainer: Nichlas Severinsen <ns@nsz.no>
pkgname=libray-git
_gitname="libray"
pkgver=0.0.5
pkgrel=1
url="https://notabug.org/necklace/libray"
pkgdesc="LibRay aims to be a Libre (FLOSS) Python application for unencrypting, extracting, repackaging, and encrypting PS3 ISOs."
arch=("any")
license=("GPLv3")
depends=("python" "python-pycryptodome" "python-beautifulsoup4" "python-tqdm" "python-requests")
makedepends=("python-setuptools")

source=("https://notabug.org/necklace/${_gitname}/archive/${pkgver}.tar.gz")

sha256sums=("8551755080437faef064986c38b955abb5f5cfb4b8ceadd6b2b6464144d462b8")

package() {
	cd $srcdir/$_gitname
	python setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

