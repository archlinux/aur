# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer:  Francois Boulogne <fboulogne at april dot org>

pkgname=python2-ssh
pkgver=1.8.0
pkgrel=3
pkgdesc="Python SSH2 protocol library"
arch=(any)
url="http://pypi.python.org/pypi/ssh"
license=('LGPL')
depends=('python2' 'pycrypto')
makedepends=('python2-distribute')
checkdepends=('python2-nose')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://pypi.python.org/packages/source/s/ssh/ssh-$pkgver.tar.gz")
md5sums=('bc4dd59ec0c7bdf78a3840652cac824e')


check() {
    cd "$srcdir/ssh-$pkgver"
    python2 test.py
}

package() {
    cd "$srcdir/ssh-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1

    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
