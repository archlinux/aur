# Maintainer: Vincent Demeester <vincent@sbr.io>
# Contributer: Alex Ogier <alex.ogier@gmail.com>
pkgname=ruby-build
pkgver=20150519
pkgrel=1
pkgdesc="Compile and install Ruby"
arch=('any')
url="http://github.com/sstephenson/ruby-build"
license=('MIT')
optdepends=('git: install ruby from git')
source=($url/tarball/v$pkgver)
md5sums=('fc4bd4ef358235ab6f2befb23251f399')

build() {
    cd $srcdir

    tar -x --strip-components 1 -zf "v$pkgver"
}

package() {
    cd $srcdir

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    PREFIX="$pkgdir/usr" ./install.sh
}
