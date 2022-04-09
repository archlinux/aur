pkgname=python-symfit
pkgver=0.5.5
pkgrel=1
pkgdesc='Symbolic fitting for python - fitting as it should be'
arch=('any')
url='https://github.com/tBuLi/symfit'
depends=('python' 'python-numpy' 'python-sympy' 'python-toposort')
makedepends=('python-setuptools' 'python-pbr')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tBuLi/symfit/archive/$pkgver.tar.gz")
md5sums=('33e26437d279cf518275e25a7e2c1f67')

package() {
    cd "$srcdir/symfit-$pkgver"
    # prefix version envvar to prevent pbr from getting confused over version numbers in some setups
    # background can be found here: https://docs.openstack.org/pbr/latest/user/packagers.html#versioning
    PBR_VERSION=$pkgver python setup.py install --root="$pkgdir/" --optimize=1

    install -D "$srcdir/symfit-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
