# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-linuxfd
pkgver=1.4.4
pkgrel=2
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
  "b8bf6847b5c8e50e0842024d2911bfc1048db9abf37582a310cd57070971d692"
)

build() {
	cd "$srcdir/linuxfd-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/linuxfd-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
