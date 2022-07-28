# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=pythonprop
pkgver=0.30.1
pkgrel=1
pkgdesc='A collection of scripts using the VOACAP HF propagation prediction engine'
arch=('any')
url='https://github.com/jawatson/pythonprop'
license=('GPL2')
depends=('voacapl' 'python-matplotlib' 'python-cartopy' 'python-scipy')
makedepends=('git' 'yelp-tools')
conflicts=('pythonprop')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('424848448819cf7e3ebe3f82006bb33fdc0e10b88944cf54998a99ca618e2ee1')

prepare() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
