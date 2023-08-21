# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-colour-datasets
_name=colour_datasets
pkgver=0.2.1
pkgrel=1
pkgdesc="Colour science datasets for use with Colour"
arch=('any')
url="https://github.com/colour-science/colour-datasets"
license=('custom:BSD-3-clause')
makedepends=('python-setuptools')
depends=('python-cachetools' 'python-colour-science' 'python-opencv' 'python-tqdm' 'python-xlrd')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('57ba3c0fda0cac6986122fe36006ac26f4bfb0af10c5ff3cc4a5c2a02aeb8338')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}