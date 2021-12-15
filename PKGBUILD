# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=interrofont
pkgver=0.1.2
pkgrel=2
pkgdesc='General purpose tool for investigating OTF/TTF information from the command line'
arch=(any)
url="http://www.corvelsoftware.co.uk/software/$pkgname"
license=(MIT)
depends=(python
         python-fonttools)
makedepends=(python-setuptools)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('f3093163d86a5ba4cd9802f2fdeb047bf7269da757114389ead33f5a2b40b5aa')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
