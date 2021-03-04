# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gphotos-sync
pkgver=2.14.2
pkgrel=1
pkgdesc='Google Photos and Albums backup tool'
arch=(any)
url="https://github.com/gilesknap/$pkgname"
license=('MIT')
_py_deps=('attrs'
          'exif'
          'appdirs'
          'requests-oauthlib'
          'yaml'
          'psutil')
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('713773dfb7798636382b1efa3efda6d812794ed8d8eaa38e7ec30522ccaa02f7')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
