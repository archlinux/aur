# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-linuxfd
pkgver=1.5
pkgrel=1
pkgdesc="Bindings for the Linux eventfd/signalfd/timerfd/inotify syscalls"
arch=('x86_64')
license=('LGPL3')
url='https://pypi.python.org/pypi/linuxfd/'
depends=('python')
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/l/linuxfd/linuxfd-$pkgver.tar.gz"
)
sha256sums=(
  'b8c00109724b68e093f9b556edd78e41ed65fb8d969fd0e83186a97b5d3139b4'
)

build() {
	cd "$srcdir/linuxfd-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/linuxfd-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
