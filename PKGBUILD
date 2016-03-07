pkgname=starcal
pkgver=3.0.1
pkgrel=1
pkgdesc='A full-featured international calendar writen in Python'
arch=('any')
url='http://ilius.github.io/starcal'
license=('GPLv3')
depends=('python>=3.2' 'python-gobject' 'python-httplib2' 'python-psutil' 'python-dateutil' 'python-pymongo')
optdepends=('python-igraph')
makedepends=()
conflicts=('starcal-git')
source=('https://github.com/ilius/starcal/archive/3.0.1.tar.gz')
md5sums=('2267257fdfe03dd444b9cdf8210b2cfe')
prepare() {
    sed -i s/sudo// "$srcdir/$pkgname-$pkgver"/locale.d/install
}
package() {
    "$srcdir/$pkgname-$pkgver"/install "$pkgdir" --for-pkg
}
