# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-bonsai')
pkgver=1.1.0
pkgrel=2
pkgdesc="Python module for LDAPv3 using libldap2/WinLDAP"
arch=('x86_64')
url='https://github.com/noirello/bonsai'
license=('MIT')
makedepends=('python-setuptools')
depends=('libldap>=2' 'libsasl>=2' 'python>=3.5' 'krb5')
optdepends=('python-gevent: enable bonsai.gevent'
            'python-tornado: enable bonsai.tornado')
options=(!emptydirs)
sha256sums=('4d42f4dc00267d78d83abbe17a0aad322b41393303ecc9bf4d3de9e6ed092f99')
source=("$url/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/bonsai-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
