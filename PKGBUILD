_name=asif
pkgname="python-${_name}"
pkgver=0.2.1
pkgrel=1
pkgdesc="A Python 3.5, asyncio- and decorator-based IRC framework"
url="https://github.com/minus7/asif"
arch=("any")
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ce611356802567852dda6323979b678f3fc5568216b997fedc769544f0897ec7')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
