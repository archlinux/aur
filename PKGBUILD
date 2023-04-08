# Contributor: Balló György <ballogyor+arch at gmail dot com>

_pkgbase=PyDrive
pkgname=python-pydrive
pkgver=1.3.1
pkgrel=6
pkgdesc="Google Drive API Python wrapper library"
arch=('any')
url="https://github.com/gsuitedevs/PyDrive"
license=('Apache')
depends=('python-google-api-python-client' 'python-oauth2client' 'python-yaml')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gsuitedevs/$_pkgbase/archive/$pkgver.tar.gz")
sha256sums=('75cc44c2d5936559359287bf273c0345165900f7ccf1aba86d9565e7dc6144fc')

build() {
	cd $_pkgbase-$pkgver
	python setup.py build
}

package() {
	cd $_pkgbase-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1 --skip-build
}
