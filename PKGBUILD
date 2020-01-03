# Maintainer: Andrea Scarpino <andrea at archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com

pkgname=python2-s3transfer
pkgver=0.2.1
pkgrel=4
pkgdesc='Amazon S3 Transfer Manager for Python'
arch=('any')
url="https://github.com/boto/s3transfer"
license=('Apache')
depends=('python2-botocore')
makedepends=('python2-setuptools')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
md5sums=('6514cc8cbb38d0adf97fa94b58e42d7e')

build() {
  cd s3transfer-$pkgver
  python2 setup.py build
}

package() {
  cd s3transfer-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
