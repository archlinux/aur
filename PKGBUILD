# Maintainer: Benjamin Görler <ben at greenflare dot io>


_pkgname=greenflare
pkgname=greenflare
pkgver=0.97
pkgrel=1
pkgdesc='A light weight SEO web crawler an analysis tool'
arch=('any')
url='https://greenflare.io'
license=('GPLv3')
depends=('python' 'tcl' 'tk' 'python-lxml' 'python-requests' 'python-cssselect' 'python-pillow' 'python-packaging' 'python-ua-parser')
optdepends=('python-ttkthemes: modern gui theme support')
makedepends=('python-setuptools')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/beb7/gflare-tk/archive/0.97.tar.gz")

build() {
  cd gflare-tk-$pkgver
  python setup.py build
}

package() {
  cd gflare-tk-$pkgver
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

sha256sums=('0cb82de99d6bdde8a12d692f7cddde5379680629840286a77528777c59985f62')
