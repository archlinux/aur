# Maintainer: Benjamin Görler <ben at greenflare dot io>


_pkgname=greenflare
pkgname=greenflare
pkgver=0.98.1
pkgrel=1
pkgdesc='A light weight SEO web crawler and analysis tool'
arch=('any')
url='https://greenflare.io'
license=('GPLv3')
depends=('python' 'tcl' 'tk' 'python-lxml' 'python-requests' 'python-cssselect' 'python-pillow' 'python-packaging' 'python-ua-parser')
optdepends=('python-ttkthemes: modern gui theme support')
makedepends=('python-setuptools')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/beb7/gflare-tk/archive/$pkgver.tar.gz")

build() {
  cd gflare-tk-$pkgver
  python setup.py build
}

package() {
  cd gflare-tk-$pkgver
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

sha256sums=('2a2c73bc6bbb69efff75c7aa0850d1b0602d7705517d2321046114af1841bc15')
