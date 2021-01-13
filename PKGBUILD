# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Ryan Gonzalez <rymg19@gmail.com>

pkgname=python-plac
pkgver=1.3.1
pkgrel=1
pkgdesc="The smartest command line arguments parser in the world"
url="https://pypi.org/project/plac/"
depends=(python)
makedepends=(python-setuptools)
license=(BSD)
arch=(any)
source=("https://files.pythonhosted.org/packages/a3/86/ef1da1b9ad0616d07e71c24eef29d56e4d0ec2fbd38e9bcf9eaacaf65342/plac-1.3.1.tar.gz")
sha256sums=('9ebe589ae371c0f863848cebffbfa1394e814a9b8b5a5a42ea373572d29d856d')


build() {
	cd "plac-${pkgver}"
	python setup.py build
}

package() {
	cd "plac-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-plac/LICENSE"
}
