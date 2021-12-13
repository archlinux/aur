# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gphotos-sync
pkgver=2.14.2
pkgrel=2
pkgdesc='Google Photos and Albums backup tool'
arch=(any)
url="https://github.com/gilesknap/$pkgname"
license=('MIT')
_py_deps=(attrs
          appdirs
          exif
          psutil
          requests-oauthlib
          yaml)
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(python-setuptools)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('713773dfb7798636382b1efa3efda6d812794ed8d8eaa38e7ec30522ccaa02f7')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
