# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=accimage
pkgname=python-$_pkgname
pkgver=0.2.0
_pkgver="v$pkgver"
pkgrel=2
pkgdesc="high performance image loading and augmenting routines mimicking PIL.Image interface"
arch=(x86_64)
url=https://github.com/pytorch/accimage
license=(bsd)
depends=(python-ipp)
makedepends=(python-pip python-ipp-include)
source=("https://github.com/pytorch/$_pkgname/archive/refs/tags/$_pkgver.tar.gz")
sha256sums=('2122fa7ac3c570975fac47ad3d4d1fdbaefedf27430cba70efb674e83de3450b')

package() {
	cd "$_pkgname-$pkgver" || return 1
	python setup.py install --root $pkgdir
}
