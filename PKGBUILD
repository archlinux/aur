pkgbase=python-appjar
pkgname=(python-appjar python2-appjar)
pkgver=0.93
pkgrel=1
pkgdesc="Simple Tkinter GUIs in Python"
arch=($CARCH)
license=(Apache)
url='https://github.com/jarvisteach/appJar'
makedepends=('python-setuptools' 'python2-setuptools')
options=(!strip)
source=("appJar-${pkgver}.tar.gz::https://github.com/jarvisteach/appJar/archive/v${pkgver}.tar.gz")
sha256sums=('64057f719c4db6eb82f30e017c7dc72eb182f0b0cc4d55540ab7c351cbf4e289')

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