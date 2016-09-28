pkgname=starcal
pkgver=3.0.4
pkgrel=1
pkgdesc='A full-featured international calendar writen in Python'
arch=('any')
url='http://ilius.github.io/starcal'
license=('GPLv3')
depends=('python>=3.2' 'python-gobject' 'python-httplib2' 'python-psutil' 'python-dateutil' 'python-pymongo')
optdepends=('python-igraph')
makedepends=()
conflicts=('starcal-git')
source=("https://github.com/ilius/starcal/archive/$pkgver.tar.gz")
md5sums=('3c08c2d26c60cc6f32cb0e6cedfc4370')
prepare() {
    sed -i s/sudo// "$srcdir/$pkgname-$pkgver"/locale.d/install
}
package() {
    "$srcdir/$pkgname-$pkgver"/install "$pkgdir" --for-pkg
}
