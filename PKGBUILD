pkgname=papis-zotero
pkgver=0.1.2
pkgrel=2
pkgdesc='Zotero remote server for papis'
arch=('any')
url='https://github.com/papis/papis-zotero'
license=('GPL')
depends=('python' 'papis')
makedepends=('python-setuptools')
source=("https://github.com/papis/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('49e16cfded75658a4b656ab9d283362de3eb3765afd2b5018ac81bf5e40da22f')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}/" --prefix="/usr"
}
