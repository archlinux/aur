# Maintainer: Matteo Salonia <saloniamatteo@protonmail.com>

pkgname=memethesis-cli
pkgver=3.3.0
pkgrel=1
pkgdesc="Create memes from the terminal"
arch=('any')
url="https://github.com/fakefred/memethesis-cli"
license=('GPL3')
depends=('python>=3' 'python-pip' 'imagemagick')
makedepends=('git')
# 3.2.1 is the version that can be downloaded in the releases
# We will be using 3.3.0 but we'll have to clone the entire repo
#source=("https://github.com/fakefred/memethesis-cli/archive/3.2.1.tar.gz")
#sha256sums=("3c0b1727bdc8e7c39885cdbfcdf6bc1daeae84b8be4780c756f053e42a37e31c")
source=("git+https://github.com/fakefred/${pkgname}.git")
sha256sums=("SKIP")

prepare() {
	# install python dependencies
	pip3 install PyYAML Pillow PyInquirer colored ascim
}

package() {
	# go into memethesis-cli
	cd "${srcdir}/${pkgname}"
	# install memethesis-cli; binary is in /usr/bin/memethesis
	python3 setup.py install --root="$pkgdir"
}
