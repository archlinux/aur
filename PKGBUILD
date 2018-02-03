_name=asif
pkgname="python-${_name}"
pkgver=0.2.2
pkgrel=1
pkgdesc="A Python 3.5, asyncio- and decorator-based IRC framework"
url="https://github.com/minus7/asif"
arch=("any")
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('db4eb4cfd45176483631172338e239c65cd60f617bf83189714cb85ff6e716e1')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
