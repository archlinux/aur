pkgname=starcal
pkgver=3.0.7
pkgrel=1
pkgdesc='A full-featured international calendar writen in Python'
arch=('any')
url='http://ilius.github.io/starcal'
license=('GPLv3')
depends=('python>=3.2' 'python-gobject' 'python-httplib2' 'python-psutil' 'python-dateutil' 'python-pymongo' 'python-cairo')
optdepends=('python-igraph'
'libappindicator-gtk3: Better systray support')
makedepends=()
conflicts=('starcal-git')
source=("https://github.com/ilius/starcal/archive/$pkgver.tar.gz")
md5sums=('9e6978ba57e7e1988c18a8e19cdfe79b')
prepare() {
    sed -i s/sudo// "$srcdir/$pkgname-$pkgver"/locale.d/install
}
package() {
    "$srcdir/$pkgname-$pkgver"/install "$pkgdir" --for-pkg
}
