# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=yarl
pkgname=python-"$_pkgname"-gns3
pkgver=1.3.0
pkgrel=1
pkgdesc="Yet another URL library (GNS3)"
arch=('any')
url="https://github.com/aio-libs/yarl/"
license=('Apache')
groups=('gns3')
provides=("python-$_pkgname")
conflicts=("python-$_pkgname")
depends=('glibc' 'python' 'python-multidict-gns3' 'python-idna')
makedepends=('cython' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aio-libs/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0d4acfd6c750612871e11c49eea43213949f1528686a184eefc1366142a6fbb3')

build() {
    cd "$_pkgname-$pkgver"
    LANG=en_US.UTF-8 python setup.py build
}

check() {
    cd "$_pkgname-$pkgver"
    python setup.py test
}

package() {
    cd "$_pkgname-$pkgver"
    LANG=en_US.UTF-8 python setup.py install --root="$pkgdir" -O1 --skip-build
}
