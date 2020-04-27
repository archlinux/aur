# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-bonsai')
pkgver=1.2.0
pkgrel=1
pkgdesc="Python module for LDAPv3 using libldap2/WinLDAP"
arch=('x86_64')
url='https://github.com/noirello/bonsai'
license=('MIT')
makedepends=('python-setuptools')
depends=('libldap>=2' 'libsasl>=2' 'python>=3.5' 'krb5')
optdepends=('python-gevent: enable bonsai.gevent'
            'python-tornado: enable bonsai.tornado')
options=(!emptydirs)
sha256sums=('1bebdb37004130c4150a88db4dba6f52ce22506fc7a7754d1be559b636c87eff')
source=("bonsai-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/bonsai-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
