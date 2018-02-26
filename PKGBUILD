# Maintainer: Hugo Rodrigues <me@hugorodrigues.net>
_pipname=minio
pkgname=python2-${_pipname}
pkgver=3.0.3
pkgrel=1
pkgdesc="Minio Python Library for Amazon S3 Compatible Cloud Storage for Python"
arch=("any")
url="https://github.com/minio/minio-py"
license=("Apache")
depends=("python2" "python2-certifi" "python2-nose")
makedepends=("python2-pip")

build() {
  pip2 install --no-deps --target="${_pipname}" ${_pipname}==${pkgver}
}

package() {
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/
  cp -r $srcdir/${_pipname}/* $pkgdir/usr/lib/python2.7/site-packages/
}

