# Maintainer: Nima Fanniasl <nma.fanniasl@gmail.com>

pkgname=araste-git
pkgver=3.1
pkgrel=1
pkgdesc="Making ascii-art out of Persian/Arabic text"
arch=('any')
url="https://github.com/ekm507/araste/"
license=('AGPLv3')
depends=("python" "python-setuptools" "python-pip")
makedepends=("git")
source=("araste-git::git+https://github.com/ekm507/araste.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --tags main | cut -d- -f1 | sed 's/v//g'
}

build() {
	cd "${srcdir}/${pkgname}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}"
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
