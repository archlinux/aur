# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-bonsai')
_name=${pkgname#python-}
pkgver=1.5.0
pkgrel=1
pkgdesc="Python module for LDAPv3 using libldap2/WinLDAP"
arch=('x86_64')
url='https://github.com/noirello/bonsai'
license=('MIT')
makedepends=('python-setuptools')
depends=('libldap>=2' 'libsasl>=2' 'python>=3.6' 'krb5')
optdepends=('python-gevent: enable bonsai.gevent'
            'python-tornado: enable bonsai.tornado'
            'python-trio: enable bonsai.trio')
options=(!emptydirs)
sha256sums=('747cf98dca475acd7b5533e422627babeb8338cac35e3b635ba0b652e9ac5b77')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
