pkgbase=python-appjar
pkgname=(python-appjar python2-appjar)
pkgver=0.94
pkgrel=1
pkgdesc="Simple Tkinter GUIs in Python"
arch=($CARCH)
license=(Apache)
url='https://github.com/jarvisteach/appJar'
makedepends=('python-setuptools' 'python2-setuptools')
options=(!strip)
source=("appJar-${pkgver}.tar.gz::https://github.com/jarvisteach/appJar/archive/v${pkgver}.tar.gz")
sha256sums=('1bef9d6546ad32b2ab4ff7abc9039d3a0e648eab1a748fdaf58889a57b1fdd71')

build() {
	cd appJar-${pkgver}
	python setup.py build
	python2 setup.py build
}

package_python-appjar() {
	depends=('python')

	cd appJar-${pkgver}
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-appjar() {
	depends=('python2')

	cd appJar-${pkgver}
	python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
