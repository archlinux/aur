# Maintainer: Abdullah <almutairi.swe@gmail.com>
pkgname='python-relayfsd'
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool that monitors a dir and automatically uploads files to another dir"
arch=('x86_64')
url="https://github.com/Almutairi0/relayfsd"
license=('MIT')
depends=('python' 'python-requests' 'python-watchdog' 'python-paramiko')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(""git+${url}.git"")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/relayfsd"
        # ./configure --prefix=/usr
	python -m build -nw
}

package() {
	cd "${srcdir}/relayfsd"
	python -m installer --destdir="$pkgdir" dist/*.whl

}
