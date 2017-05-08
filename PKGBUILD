# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname='python-linuxfd'
pkgver=1.4.4
pkgrel=1
pkgdesc="Bindings for the Linux eventfd/signalfd/timerfd/inotify syscalls"
arch=('x86_64' 'i686')
license=('LGPL3')
url='https://pypi.python.org/pypi/linuxfd/'
depends=('python')
options=(!emptydirs)
source=('https://pypi.python.org/packages/97/66/d96043ca1364150419b6896b2bd4da298599388edf6a7b9c983d56ac5256/linuxfd-1.4.4.tar.gz')
md5sums=('6f8ae466d6918731452cfb8beb19d087')

build() {
	cd "$srcdir/linuxfd-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/linuxfd-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
