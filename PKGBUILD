# Maintainer: Peter Hoeg <first name at last name dot com>
# Contributer: Vincent Demeester <vincent@sbr.io>
# Contributer: Alex Ogier <alex.ogier@gmail.com>
pkgname=ruby-build
pkgver=20150818
pkgrel=1
pkgdesc="Compile and install Ruby"
arch=('any')
url="http://github.com/sstephenson/ruby-build"
license=('MIT')
optdepends=('git: install ruby from git')
source=($url/tarball/v$pkgver)
sha1sums=('60a7a218d81c11f8d3753bc3ebe2f0ebdd4f95e8')

build() {
    cd $srcdir

    tar -x --strip-components 1 -zf "v$pkgver"
}

package() {
    cd $srcdir

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    PREFIX="$pkgdir/usr" ./install.sh
}
